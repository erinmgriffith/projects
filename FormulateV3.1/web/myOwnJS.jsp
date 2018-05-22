
<%-- 
    Document   : results
    Created on : Mar 25, 2016, 10:20:43 AM
    Author     : Erin Griffith

Contains methods and functions for converting java objects into javascript objects that can be accessed from external javascript.
Also the canvas object that the graphics will be displayed on.

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <%@ page import="java.util.*" %>
        <%@ page import="Controllers.SystemController.*" %>
        <%@ page import="Models.SystemModel.*" %>
        <%@ page import="DataAccess.*" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <a href="../src/java/Controllers/SystemController.java"></a>
    <a href="../src/java/DataAccess/Relation.java" transaction-type="RESOURCE_LOCAL"></a>
    <a href="../src/java/DataAccess/Property.java" transaction-type="RESOURCE_LOCAL"></a
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="js/utils.js" type="text/javascript"></script>
    <script src="js/Vectors.js" type="text/javascript"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script src="js/springy.js"></script>
    <script src="js/springyui_1.js"></script>
    <style>
        body{
            background-color: white;
        }
        #my_canvas{
            overflow:auto;
            overflow-style:move;
            -webkit-transition: width 2s, height 2s; /* Safari */
            transition: width 2s, height 2s;
        }
        #demo{
            position: absolute;
            top: 5px;
        }
        #formula{
            font-size: 16pt;
            font-family: "arial", arial, sans-serif;
        }
    </style>
    <title>Results</title>
</head>
<body>  
    <!--    jsp fragment, receives arrays of property, relation, and formula objects, as attributes passed from controller-->
    <%
        Property[] prop = (Property[]) request.getAttribute("properties");
        Relation[] relate = (Relation[]) request.getAttribute("relations");
        Formula[] formula = (Formula[]) request.getAttribute("formulas");
    %>


    <!--   functions responsible for initializing the elements that will be passed to the springy ui graph -->
    <p id="formula">Formula: <span id="out">?</span></p>

    <canvas id="my_canvas" width="1200" height="820"></canvas>
    <script type="text/javascript">

        var r = [];
        var score;
        var scoreCard = 0;
        var saucers = [];
        var doPlay = false;
        var round = 0;
        var wasHit = false;
        var utils = {};
        var propNodes = [];
        var edges = [];
        var wasClicked = false;
        var isOverNode = false;
        var isPressed;
        var nodeIsActivated = false;
        var edgeWasDrawn = [];
        var usedFormulas = [];
        var usedEnd = [];
        var p;
        // mouse events 
        // records position on page and figures the coords with the offset of the canvas on the page.
        // //This function does that by taking a dom element as arg, attaching a mousemove event handler to it and returning an object ith x and y properties.
        //attaches click event handler that calls the pressStart() function when triggered
        utils.captureMouse = function (element) {
            var mouse = {x: 0, y: 0};
            element.addEventListener('mousemove', function (event) {     
                var x, y;     
                if (event.pageX || event.pageY) {      
                     		x = event.pageX;      
                     		y = event.pageY;     
                } else {      
                    x = event.clientX + document.body.scrollLeft +  document.documentElement.scrollLeft;      
                    y = event.clientY + document.body.scrollTop +  document.documentElement.scrollTop;     
                }     
                x -= element.offsetLeft;     
                y -= element.offsetTop;     
                mouse.x = x;    
                mouse.y = y;  
                     
            }, false);

            element.addEventListener('mousedown', function (event) {
                isPressed = true;
            }, false);
            element.addEventListener('mouseup', function (event) {  
                nodeIsActivated = false;
                isPressed = false;
            }, false);
            return mouse;
        };




        function Relation(from, to, formula, id) {
            this.from = from;
            this.to = to;
            this.startX = from.x;
            this.startY = from.y;
            this.endX = to.x;
            this.endY = to.y;
            this.formula = formula;
            this.id = id;
        }

        function Node(posX, posY, radius, color, scaleX, scaleY, label, id, description) {
            if (radius === undefined) {
                this.radius = 10;
            }
            if (color === undefined) {
                color = "red";
            }
            this.radius = radius;
            this.color = color;
            this.x = posX;
            this.y = posY;
            this.scaleX = scaleX;
            this.scaleY = scaleY;
            this.lineWidth = 1;
            this.rotation = 0;
            this.label = label;
            this.active = false;
            this.id = id;
            this.description = description;
        }

        function Edge(sourceNode, targetNode, formula) {
            this.from = sourceNode.label;
            this.to = targetNode.label;
            this.start = sourceNode;
            this.end = targetNode;
            this.startX = sourceNode.x;
            this.startY = sourceNode.y;
            this.endX = targetNode.x;
            this.endY = targetNode.y;
            this.active = false;
            this.formula = formula.slice(1, -1);
            this.txt = " ";
            this.width = .25;
            lx = this.startX + this.endX;
            ly = this.startY + this.endY;
            this.color = 'black';
            this.labelx = lx / 2;
            this.labely = ly / 2;
        }

        function isInList(formula) {
            var aFormula;
            if (usedFormulas.indexOf(formula) > -1) {  //if in list already
                aFormula = "test ";
            } else if (usedFormulas.indexOf(formula) === -1) { //if not in list
                aFormula = formula;
                usedFormulas.push(formula);
            }
            return aFormula;
        }

        Edge.prototype.draw = function (context) {
            context.save();
            context.lineWidth = this.width;
            context.strokeStyle = this.color;
            context.beginPath();
            context.moveTo(this.startX, this.startY);
            context.lineTo(this.endX, this.endY);
            context.fillText(this.txt, this.labelx, this.labely);
            context.stroke();
            context.restore();
        };
        
        function isPositive(point) {
            if (point < 0) {
                point = point * -1;
            }
            return point;
        }

        // prototype draw functions
        Node.prototype.draw = function (context) {
            context.save();
            context.translate(this.x, this.y);
            context.rotate(this.rotation);
            context.scale(this.scaleX, this.scaleY);
            context.lineWidth = this.lineWidth;
            context.fillStyle = this.color;
            context.moveTo(0, 0);
            context.beginPath();
            context.arc(0, 0, 10, 0, 2 * Math.PI);
            context.closePath();
            context.fill();
            context.stroke();
            context.fillStyle = 'black';
            context.fillText(this.label, 15, 0);
            context.restore();
        };

        var drawSkyAndGrass = function (ctx) { // The gradient line is defined from the top to the bottom of the canvas. 
            var cg = ctx.createLinearGradient(0, 0, 0, ctx.canvas.height * 1.5); // Start off with sky blue at the top. 
            cg.addColorStop(0, '#aaa'); // Fade to white in the middle.
            cg.addColorStop(0.9, '#addee5'); // Green for the top of the grass. 
            ctx.fillStyle = cg; // Finally, fill a rectangle the same size as the canvas. 
            ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        };

        // instantiate object functions
        function makeNodes() {
            propNodes[0] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 500), 10, "pink", 1, 1, "<%=prop[0].getName().toString()%>", "<%=prop[0].getID().toString()%>", "<%=prop[0].getDescription().toString()%>"); 
            propNodes[1] = new Node(Math.ceil(Math.random() * 100), Math.ceil(Math.random() * 1000), 10, "LightSkyBlue", 1, 1, "<%=prop[1].getName().toString()%>", "<%=prop[1].getID().toString()%>", "<%=prop[1].getDescription().toString()%>");
            propNodes[2] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 500), 10, "lightGreen", 1, 1, "<%=prop[2].getName().toString()%>", "<%=prop[2].getID().toString()%>", "<%=prop[2].getDescription().toString()%>");
            propNodes[3] = new Node(Math.ceil(Math.random() * 1000), Math.ceil(Math.random() * 300), 10, "LightSteelBlue", 1, 1, "<%=prop[3].getName().toString()%>", "<%=prop[3].getID().toString()%>", "<%=prop[3].getDescription().toString()%>");
            propNodes[4] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 500), 10, "PeachPuff", 1, 1, "<%=prop[4].getName().toString()%>", "<%=prop[4].getID().toString()%>", "<%=prop[4].getDescription().toString()%>");
            propNodes[5] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 1000), 10, "pink", 1, 1, "<%=prop[5].getName().toString()%>", "<%=prop[5].getID().toString()%>", "<%=prop[5].getDescription().toString()%>");
            propNodes[6] = new Node(Math.ceil(Math.random() * 100), Math.ceil(Math.random() * 500), 10, "LightSkyBlue", 1, 1, "<%=prop[6].getName().toString()%>", "<%=prop[6].getID().toString()%>", "<%=prop[6].getDescription().toString()%>");
            propNodes[7] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 100), 10, "PeachPuff", 1, 1, "<%=prop[7].getName().toString()%>", "<%=prop[7].getID().toString()%>", "<%=prop[7].getDescription().toString()%>");
            propNodes[8] = new Node(Math.ceil(Math.random() * 100), Math.ceil(Math.random() * 300), 10, "plum", 1, 1, "<%=prop[8].getName().toString()%>", "<%=prop[8].getID().toString()%>", "<%=prop[8].getDescription().toString()%>");
            propNodes[9] = new Node(Math.ceil(Math.random() * 300), Math.ceil(Math.random() * 100), 10, "pink", 1, 1, "<%=prop[9].getName().toString()%>", "<%=prop[9].getID().toString()%>", "<%=prop[9].getDescription().toString()%>");
            propNodes[10] = new Node(Math.ceil(Math.random() * 100), Math.ceil(Math.random() * 500), 10, "lightGreen", 1, 1, "<%=prop[10].getName().toString()%>", "<%=prop[10].getID().toString()%>", "<%=prop[10].getDescription().toString()%>");
            propNodes[11] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 1000), 10, "LightSkyBlue", 1, 1, "<%=prop[11].getName().toString()%>", "<%=prop[11].getID().toString()%>", "<%=prop[11].getDescription().toString()%>");
            propNodes[12] = new Node(Math.ceil(Math.random() * 1000), Math.ceil(Math.random() * 500), 10, "plum", 1, 1, "<%=prop[12].getName().toString()%>", "<%=prop[12].getID().toString()%>", "<%=prop[12].getDescription().toString()%>");
            propNodes[13] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 500), 10, "plum", 1, 1, "<%=prop[13].getName().toString()%>", "<%=prop[13].getID().toString()%>", "<%=prop[13].getDescription().toString()%>");
            propNodes[14] = new Node(Math.ceil(Math.random() * 1000), Math.ceil(Math.random() * 500), 10, "pink", 1, 1, "<%=prop[14].getName().toString()%>", "<%=prop[14].getID().toString()%>", "<%=prop[14].getDescription().toString()%>");
            propNodes[15] = new Node(Math.ceil(Math.random() * 300), Math.ceil(Math.random() * 500), 10, "plum", 1, 1, "<%=prop[15].getName().toString()%>", "<%=prop[15].getID().toString()%>", "<%=prop[15].getDescription().toString()%>");
            propNodes[16] = new Node(Math.ceil(Math.random() * 300), Math.ceil(Math.random() * 1000), 10, "LightSkyBlue", 1, 1, "<%=prop[16].getName().toString()%>", "<%=prop[16].getID().toString()%>", "<%=prop[16].getDescription().toString()%>");
            propNodes[17] = new Node(Math.ceil(Math.random() * 1000), Math.ceil(Math.random() * 500), 10, "PeachPuff", 1, 1, "<%=prop[17].getName().toString()%>", "<%=prop[17].getID().toString()%>", "<%=prop[17].getDescription().toString()%>");
            propNodes[18] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 500), 10, "pink", 1, 1, "<%=prop[18].getName().toString()%>", "<%=prop[18].getID().toString()%>", "<%=prop[18].getDescription().toString()%>");
            propNodes[19] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 500), 10, "plum", 1, 1, "<%=prop[19].getName().toString()%>", "<%=prop[19].getID().toString()%>", "<%=prop[19].getDescription().toString()%>");
            propNodes[20] = new Node(Math.ceil(Math.random() * 500), Math.ceil(Math.random() * 500), 10, "lightGreen", 1, 1, "<%=prop[20].getName().toString()%>", "<%=prop[20].getID().toString()%>", "<%=prop[20].getDescription().toString()%>");
            //            for (i = 0; i < propNodes.length; i++) {
            //                console.log(i + " posX: " + propNodes[i].x + "    posY: " + propNodes[i].y + "    name: " + propNodes[i].label + "    id: " + propNodes[i].id);
            //            }
        }

        function makeRelations() {
            r[0] = new Relation("<%=relate[0].getFromProperty()%>", "<%=relate[0].getToProperty()%>", "<%=relate[0].getFormula()%>", "r0");
            r[1] = new Relation("<%=relate[1].getFromProperty()%>", "<%=relate[1].getToProperty()%>", "<%=relate[1].getFormula()%>", "r1");
            r[2] = new Relation("<%=relate[2].getFromProperty()%>", "<%=relate[2].getToProperty()%>", "<%=relate[2].getFormula()%>", "r2");
            r[3] = new Relation("<%=relate[3].getFromProperty()%>", "<%=relate[3].getToProperty()%>", "<%=relate[3].getFormula()%>", "r3");
            r[4] = new Relation("<%=relate[4].getFromProperty()%>", "<%=relate[4].getToProperty()%>", "<%=relate[4].getFormula()%>", "r4");
            r[5] = new Relation("<%=relate[5].getFromProperty()%>", "<%=relate[5].getToProperty()%>", "<%=relate[5].getFormula()%>", "r5");
            r[6] = new Relation("<%=relate[6].getFromProperty()%>", "<%=relate[6].getToProperty()%>", "<%=relate[6].getFormula()%>", "r6");
            r[7] = new Relation("<%=relate[7].getFromProperty()%>", "<%=relate[7].getToProperty()%>", "<%=relate[7].getFormula()%>", "r7");
            r[8] = new Relation("<%=relate[8].getFromProperty()%>", "<%=relate[8].getToProperty()%>", "<%=relate[8].getFormula()%>", "r8");
            r[9] = new Relation("<%=relate[9].getFromProperty()%>", "<%=relate[9].getToProperty()%>", "<%=relate[9].getFormula()%>", "r9");
            r[10] = new Relation("<%=relate[10].getFromProperty()%>", "<%=relate[10].getToProperty()%>", "<%=relate[10].getFormula()%>", "r10");
            r[11] = new Relation("<%=relate[11].getFromProperty()%>", "<%=relate[11].getToProperty()%>", "<%=relate[11].getFormula()%>", "r11");
            r[12] = new Relation("<%=relate[12].getFromProperty()%>", "<%=relate[12].getToProperty()%>", "<%=relate[12].getFormula()%>", "r12");
            r[13] = new Relation("<%=relate[13].getFromProperty()%>", "<%=relate[13].getToProperty()%>", "<%=relate[13].getFormula()%>", "r13");
            r[14] = new Relation("<%=relate[14].getFromProperty()%>", "<%=relate[14].getToProperty()%>", "<%=relate[14].getFormula()%>", "r14");
            r[15] = new Relation("<%=relate[15].getFromProperty()%>", "<%=relate[15].getToProperty()%>", "<%=relate[15].getFormula()%>", "r15");
            r[16] = new Relation("<%=relate[16].getFromProperty()%>", "<%=relate[16].getToProperty()%>", "<%=relate[16].getFormula()%>", "r6");
            r[17] = new Relation("<%=relate[17].getFromProperty()%>", "<%=relate[17].getToProperty()%>", "<%=relate[17].getFormula()%>", "r7");
            r[18] = new Relation("<%=relate[18].getFromProperty()%>", "<%=relate[18].getToProperty()%>", "<%=relate[18].getFormula()%>", "r8");
            r[19] = new Relation("<%=relate[19].getFromProperty()%>", "<%=relate[19].getToProperty()%>", "<%=relate[19].getFormula()%>", "r9");
            r[20] = new Relation("<%=relate[20].getFromProperty()%>", "<%=relate[20].getToProperty()%>", "<%=relate[20].getFormula()%>", "r20");
            r[21] = new Relation("<%=relate[21].getFromProperty()%>", "<%=relate[21].getToProperty()%>", "<%=relate[21].getFormula()%>", "r21");
            r[22] = new Relation("<%=relate[22].getFromProperty()%>", "<%=relate[22].getToProperty()%>", "<%=relate[22].getFormula()%>", "r22");
            r[23] = new Relation("<%=relate[23].getFromProperty()%>", "<%=relate[23].getToProperty()%>", "<%=relate[23].getFormula()%>", "r23");
            r[24] = new Relation("<%=relate[24].getFromProperty()%>", "<%=relate[24].getToProperty()%>", "<%=relate[24].getFormula()%>", "r24");
            r[25] = new Relation("<%=relate[25].getFromProperty()%>", "<%=relate[25].getToProperty()%>", "<%=relate[25].getFormula()%>", "r25");
            r[26] = new Relation("<%=relate[26].getFromProperty()%>", "<%=relate[26].getToProperty()%>", "<%=relate[26].getFormula()%>", "r26");
            r[27] = new Relation("<%=relate[27].getFromProperty()%>", "<%=relate[27].getToProperty()%>", "<%=relate[27].getFormula()%>", "r27");
            r[28] = new Relation("<%=relate[28].getFromProperty()%>", "<%=relate[28].getToProperty()%>", "<%=relate[28].getFormula()%>", "r28");
            r[29] = new Relation("<%=relate[29].getFromProperty()%>", "<%=relate[29].getToProperty()%>", "<%=relate[29].getFormula()%>", "r29");
            r[30] = new Relation("<%=relate[30].getFromProperty()%>", "<%=relate[30].getToProperty()%>", "<%=relate[30].getFormula()%>", "r30");
            r[31] = new Relation("<%=relate[31].getFromProperty()%>", "<%=relate[31].getToProperty()%>", "<%=relate[31].getFormula()%>", "r31");
            r[32] = new Relation("<%=relate[32].getFromProperty()%>", "<%=relate[32].getToProperty()%>", "<%=relate[32].getFormula()%>", "r32");
            r[33] = new Relation("<%=relate[33].getFromProperty()%>", "<%=relate[33].getToProperty()%>", "<%=relate[33].getFormula()%>", "r33");
            r[34] = new Relation("<%=relate[34].getFromProperty()%>", "<%=relate[34].getToProperty()%>", "<%=relate[34].getFormula()%>", "r34");
            r[35] = new Relation("<%=relate[35].getFromProperty()%>", "<%=relate[35].getToProperty()%>", "<%=relate[35].getFormula()%>", "r35");
            r[36] = new Relation("<%=relate[36].getFromProperty()%>", "<%=relate[36].getToProperty()%>", "<%=relate[36].getFormula()%>", "r36");
            r[37] = new Relation("<%=relate[37].getFromProperty()%>", "<%=relate[37].getToProperty()%>", "<%=relate[37].getFormula()%>", "r37");
            r[38] = new Relation("<%=relate[38].getFromProperty()%>", "<%=relate[38].getToProperty()%>", "<%=relate[38].getFormula()%>", "r38");
            r[39] = new Relation("<%=relate[39].getFromProperty()%>", "<%=relate[39].getToProperty()%>", "<%=relate[39].getFormula()%>", "r39");
            r[40] = new Relation("<%=relate[40].getFromProperty()%>", "<%=relate[40].getToProperty()%>", "<%=relate[40].getFormula()%>", "r40");
            r[41] = new Relation("<%=relate[41].getFromProperty()%>", "<%=relate[41].getToProperty()%>", "<%=relate[41].getFormula()%>", "r41");
            r[42] = new Relation("<%=relate[42].getFromProperty()%>", "<%=relate[42].getToProperty()%>", "<%=relate[42].getFormula()%>", "r42");
            r[43] = new Relation("<%=relate[43].getFromProperty()%>", "<%=relate[43].getToProperty()%>", "<%=relate[43].getFormula()%>", "r43");
            r[44] = new Relation("<%=relate[44].getFromProperty()%>", "<%=relate[44].getToProperty()%>", "<%=relate[44].getFormula()%>", "r44");
            r[45] = new Relation("<%=relate[45].getFromProperty()%>", "<%=relate[45].getToProperty()%>", "<%=relate[45].getFormula()%>", "r45");
            r[46] = new Relation("<%=relate[46].getFromProperty()%>", "<%=relate[46].getToProperty()%>", "<%=relate[46].getFormula()%>", "r46");
            r[47] = new Relation("<%=relate[47].getFromProperty()%>", "<%=relate[47].getToProperty()%>", "<%=relate[47].getFormula()%>", "r47");
            r[48] = new Relation("<%=relate[48].getFromProperty()%>", "<%=relate[48].getToProperty()%>", "<%=relate[48].getFormula()%>", "r48");
            r[49] = new Relation("<%=relate[49].getFromProperty()%>", "<%=relate[49].getToProperty()%>", "<%=relate[49].getFormula()%>", "r49");
            r[50] = new Relation("<%=relate[50].getFromProperty()%>", "<%=relate[50].getToProperty()%>", "<%=relate[50].getFormula()%>", "r50");
            r[51] = new Relation("<%=relate[51].getFromProperty()%>", "<%=relate[51].getToProperty()%>", "<%=relate[51].getFormula()%>", "r51");
            r[52] = new Relation("<%=relate[52].getFromProperty()%>", "<%=relate[52].getToProperty()%>", "<%=relate[52].getFormula()%>", "r52");
            r[53] = new Relation("<%=relate[53].getFromProperty()%>", "<%=relate[53].getToProperty()%>", "<%=relate[53].getFormula()%>", "r53");
            r[54] = new Relation("<%=relate[54].getFromProperty()%>", "<%=relate[54].getToProperty()%>", "<%=relate[54].getFormula()%>", "r54");
            r[55] = new Relation("<%=relate[55].getFromProperty()%>", "<%=relate[55].getToProperty()%>", "<%=relate[55].getFormula()%>", "r55");
            r[56] = new Relation("<%=relate[56].getFromProperty()%>", "<%=relate[56].getToProperty()%>", "<%=relate[56].getFormula()%>", "r56");
            r[57] = new Relation("<%=relate[57].getFromProperty()%>", "<%=relate[57].getToProperty()%>", "<%=relate[57].getFormula()%>", "r57");
            r[58] = new Relation("<%=relate[58].getFromProperty()%>", "<%=relate[58].getToProperty()%>", "<%=relate[58].getFormula()%>", "r58");
            r[59] = new Relation("<%=relate[59].getFromProperty()%>", "<%=relate[59].getToProperty()%>", "<%=relate[59].getFormula()%>", "r59");
            r[60] = new Relation("<%=relate[60].getFromProperty()%>", "<%=relate[60].getToProperty()%>", "<%=relate[60].getFormula()%>", "r60");
            r[61] = new Relation("<%=relate[61].getFromProperty()%>", "<%=relate[61].getToProperty()%>", "<%=relate[61].getFormula()%>", "r61");
            r[62] = new Relation("<%=relate[62].getFromProperty()%>", "<%=relate[62].getToProperty()%>", "<%=relate[62].getFormula()%>", "r62");
            r[63] = new Relation("<%=relate[63].getFromProperty()%>", "<%=relate[63].getToProperty()%>", "<%=relate[63].getFormula()%>", "r63");
            r[64] = new Relation("<%=relate[64].getFromProperty()%>", "<%=relate[64].getToProperty()%>", "<%=relate[64].getFormula()%>", "r64");
            r[65] = new Relation("<%=relate[65].getFromProperty()%>", "<%=relate[65].getToProperty()%>", "<%=relate[65].getFormula()%>", "r65");
            r[66] = new Relation("<%=relate[66].getFromProperty()%>", "<%=relate[66].getToProperty()%>", "<%=relate[66].getFormula()%>", "r66");
            r[67] = new Relation("<%=relate[67].getFromProperty()%>", "<%=relate[67].getToProperty()%>", "<%=relate[67].getFormula()%>", "r67");
            r[68] = new Relation("<%=relate[68].getFromProperty()%>", "<%=relate[68].getToProperty()%>", "<%=relate[8].getFormula()%>", "r68");
            r[69] = new Relation("<%=relate[69].getFromProperty()%>", "<%=relate[69].getToProperty()%>", "<%=relate[69].getFormula()%>", "r69");
            r[70] = new Relation("<%=relate[70].getFromProperty()%>", "<%=relate[70].getToProperty()%>", "<%=relate[70].getFormula()%>", "r70");
            r[71] = new Relation("<%=relate[71].getFromProperty()%>", "<%=relate[71].getToProperty()%>", "<%=relate[71].getFormula()%>", "r71");
            r[72] = new Relation("<%=relate[72].getFromProperty()%>", "<%=relate[72].getToProperty()%>", "<%=relate[72].getFormula()%>", "r72");
            r[73] = new Relation("<%=relate[73].getFromProperty()%>", "<%=relate[73].getToProperty()%>", "<%=relate[73].getFormula()%>", "r73");
            r[74] = new Relation("<%=relate[74].getFromProperty()%>", "<%=relate[74].getToProperty()%>", "<%=relate[74].getFormula()%>", "r74");
            r[75] = new Relation("<%=relate[75].getFromProperty()%>", "<%=relate[75].getToProperty()%>", "<%=relate[75].getFormula()%>", "r75");
            r[76] = new Relation("<%=relate[76].getFromProperty()%>", "<%=relate[76].getToProperty()%>", "<%=relate[76].getFormula()%>", "r76");
            r[77] = new Relation("<%=relate[77].getFromProperty()%>", "<%=relate[77].getToProperty()%>", "<%=relate[77].getFormula()%>", "r77");
            //            for (i = 0; i < r.length; i++) {
            //                console.log(i + " from: " + r[i].from + " to: " + r[i].to + " formula: " + r[i]);
            //            }
        }
        
        
        function isDuplicateEdge(from, to) {
            for (i = 0; i < edges.length; i++) {
                if (((edges[i].from === from) || (edges[i].from === to)) && ((edges[i].to === from) || (edges[i].to === to))) {
                    return true;
                }
            }
        }
        function makeEdges() {
            edges[0] = new Edge(findFrom(r[0].from), findTo(r[0].to), r[0].formula);
            edges[1] = new Edge(findFrom(r[1].from), findTo(r[1].to), r[1].formula);
            edges[2] = new Edge(findFrom(r[2].from), findTo(r[2].to), r[2].formula);
            edges[3] = new Edge(findFrom(r[3].from), findTo(r[3].to), r[3].formula);
            edges[4] = new Edge(findFrom(r[4].from), findTo(r[4].to), r[4].formula);
            edges[5] = new Edge(findFrom(r[5].from), findTo(r[5].to), r[5].formula);
            edges[6] = new Edge(findFrom(r[6].from), findTo(r[6].to), r[6].formula);
            edges[7] = new Edge(findFrom(r[7].from), findTo(r[7].to), r[7].formula);
            edges[8] = new Edge(findFrom(r[8].from), findTo(r[8].to), r[8].formula);
            edges[9] = new Edge(findFrom(r[9].from), findTo(r[9].to), r[9].formula);
            edges[10] = new Edge(findFrom(r[10].from), findTo(r[10].to), r[10].formula);
            edges[11] = new Edge(findFrom(r[11].from), findTo(r[11].to), r[11].formula);
            edges[12] = new Edge(findFrom(r[12].from), findTo(r[12].to), r[12].formula);
            edges[13] = new Edge(findFrom(r[13].from), findTo(r[13].to), r[13].formula);
            edges[14] = new Edge(findFrom(r[14].from), findTo(r[14].to), r[14].formula);
            edges[15] = new Edge(findFrom(r[15].from), findTo(r[15].to), r[15].formula);
            edges[16] = new Edge(findFrom(r[16].from), findTo(r[16].to), r[16].formula);
            edges[17] = new Edge(findFrom(r[17].from), findTo(r[17].to), r[17].formula);
            edges[18] = new Edge(findFrom(r[18].from), findTo(r[18].to), r[18].formula);
            edges[19] = new Edge(findFrom(r[19].from), findTo(r[19].to), r[19].formula);
            edges[20] = new Edge(findFrom(r[20].from), findTo(r[20].to), r[20].formula);
            edges[21] = new Edge(findFrom(r[21].from), findTo(r[21].to), r[21].formula);
            edges[22] = new Edge(findFrom(r[22].from), findTo(r[22].to), r[22].formula);
            edges[23] = new Edge(findFrom(r[23].from), findTo(r[23].to), r[23].formula);
            edges[24] = new Edge(findFrom(r[24].from), findTo(r[24].to), r[24].formula);
            edges[25] = new Edge(findFrom(r[25].from), findTo(r[25].to), r[25].formula);
            edges[26] = new Edge(findFrom(r[26].from), findTo(r[26].to), r[26].formula);
            edges[27] = new Edge(findFrom(r[27].from), findTo(r[27].to), r[27].formula);
            edges[28] = new Edge(findFrom(r[28].from), findTo(r[28].to), r[28].formula);
            edges[29] = new Edge(findFrom(r[29].from), findTo(r[29].to), r[29].formula);
            edges[30] = new Edge(findFrom(r[30].from), findTo(r[30].to), r[30].formula);
            edges[31] = new Edge(findFrom(r[31].from), findTo(r[31].to), r[31].formula);
            edges[32] = new Edge(findFrom(r[32].from), findTo(r[32].to), r[32].formula);
            edges[33] = new Edge(findFrom(r[33].from), findTo(r[33].to), r[33].formula);
            edges[34] = new Edge(findFrom(r[34].from), findTo(r[34].to), r[34].formula);
            edges[35] = new Edge(findFrom(r[35].from), findTo(r[35].to), r[35].formula);
            edges[36] = new Edge(findFrom(r[36].from), findTo(r[36].to), r[36].formula);
            edges[37] = new Edge(findFrom(r[37].from), findTo(r[37].to), r[37].formula);
            edges[38] = new Edge(findFrom(r[38].from), findTo(r[38].to), r[38].formula);
            edges[39] = new Edge(findFrom(r[39].from), findTo(r[39].to), r[39].formula);
            edges[40] = new Edge(findFrom(r[40].from), findTo(r[40].to), r[40].formula);
            edges[41] = new Edge(findFrom(r[41].from), findTo(r[41].to), r[41].formula);
            edges[42] = new Edge(findFrom(r[42].from), findTo(r[42].to), r[42].formula);
            edges[43] = new Edge(findFrom(r[43].from), findTo(r[43].to), r[43].formula);
            edges[44] = new Edge(findFrom(r[44].from), findTo(r[44].to), r[44].formula);
            edges[45] = new Edge(findFrom(r[45].from), findTo(r[45].to), r[45].formula);
            edges[46] = new Edge(findFrom(r[46].from), findTo(r[46].to), r[46].formula);
            edges[47] = new Edge(findFrom(r[47].from), findTo(r[47].to), r[47].formula);
            edges[48] = new Edge(findFrom(r[48].from), findTo(r[48].to), r[48].formula);
            edges[49] = new Edge(findFrom(r[49].from), findTo(r[49].to), r[49].formula);
            edges[50] = new Edge(findFrom(r[50].from), findTo(r[50].to), r[50].formula);
            edges[51] = new Edge(findFrom(r[51].from), findTo(r[51].to), r[51].formula);
            edges[52] = new Edge(findFrom(r[52].from), findTo(r[52].to), r[52].formula);
            edges[53] = new Edge(findFrom(r[53].from), findTo(r[53].to), r[53].formula);
            edges[54] = new Edge(findFrom(r[54].from), findTo(r[54].to), r[54].formula);
            edges[55] = new Edge(findFrom(r[55].from), findTo(r[55].to), r[55].formula);
            edges[56] = new Edge(findFrom(r[56].from), findTo(r[56].to), r[56].formula);
            edges[57] = new Edge(findFrom(r[57].from), findTo(r[57].to), r[57].formula);
            edges[58] = new Edge(findFrom(r[58].from), findTo(r[58].to), r[58].formula);
            edges[59] = new Edge(findFrom(r[59].from), findTo(r[59].to), r[59].formula);
            edges[60] = new Edge(findFrom(r[60].from), findTo(r[60].to), r[60].formula);
            edges[61] = new Edge(findFrom(r[61].from), findTo(r[61].to), r[61].formula);
            edges[62] = new Edge(findFrom(r[62].from), findTo(r[62].to), r[62].formula);
            edges[63] = new Edge(findFrom(r[63].from), findTo(r[63].to), r[63].formula);
            edges[64] = new Edge(findFrom(r[64].from), findTo(r[64].to), r[64].formula);
            edges[65] = new Edge(findFrom(r[65].from), findTo(r[65].to), r[65].formula);
            edges[66] = new Edge(findFrom(r[66].from), findTo(r[66].to), r[66].formula);
            edges[67] = new Edge(findFrom(r[67].from), findTo(r[67].to), r[67].formula);
            edges[68] = new Edge(findFrom(r[68].from), findTo(r[68].to), r[68].formula);
            edges[69] = new Edge(findFrom(r[69].from), findTo(r[69].to), r[69].formula);
            edges[70] = new Edge(findFrom(r[70].from), findTo(r[70].to), r[70].formula);
            edges[71] = new Edge(findFrom(r[71].from), findTo(r[71].to), r[71].formula);
            edges[72] = new Edge(findFrom(r[72].from), findTo(r[72].to), r[72].formula);
            edges[73] = new Edge(findFrom(r[73].from), findTo(r[73].to), r[73].formula);
            edges[74] = new Edge(findFrom(r[74].from), findTo(r[74].to), r[74].formula);
            edges[75] = new Edge(findFrom(r[75].from), findTo(r[75].to), r[75].formula);
            edges[76] = new Edge(findFrom(r[76].from), findTo(r[76].to), r[76].formula);
            edges[77] = new Edge(findFrom(r[77].from), findTo(r[77].to), r[77].formula);
            //            for (i = 0; i < edges.length; i++) {
            //                usedFormulas.push(r[i].formula);
            //
            //                console.log(r[i].formula);
            //            
        }

        // loops through property array and finds the index of the property that corresponds to the from property of a relation
        //  uses that index to return the node that the edge should start from.
        function findFrom(from) {
            var fromNode = 0;
            for (i = 0; i < propNodes.length; i++) {
                if ((propNodes[i].id).search(from) !== -1) {
                    fromNode = propNodes[i];
                }
            }
            //          console.log("from: " + fromNode.id);
            //     usedFormulas.push(r[i].formula);
            return fromNode;
        }

        // loops through property array and finds the index of the property that corresponds to the to property of a relation
        //  uses that index to return the node that the edge should go to.
        function findTo(to) {
            var toNode = 0;
            for (j = 0; j < propNodes.length; j++) {
                if ((propNodes[j].id).search(to) !== -1) {
                    toNode = propNodes[j];
                }
            }
            //         console.log("To: " + toNode.id);
            return toNode;
        }
        
        
        //checks if edge has already been drawn
        function wasUsed(to) {
            for (j = 0; j < relation.length; j++) {
                if ((propNodes[j].id).search(to) !== -1) {
                    toNode = propNodes[j];
                }
            }
            //         console.log("To: " + toNode.id);
            return toNode;
        }

        

        //method window onload
         window.onload = function () {  
            var canvas = document.getElementById('my_canvas');   
            var mouse = utils.captureMouse(canvas); 
            var ctx = canvas.getContext('2d');   
            makeNodes(); 
            makeRelations();
            makeEdges();    
//            for (i = 0; i < usedFormulas.length; i++) {
//                console.log(usedFormulas[i].toString());
//            }


            //support functions
            // determines if the mouse has clicked on node and sets as active
            function makeActive(propertyNode) {
                if (!nodeIsActivated) {                                       //checks to see if there is already a node in active state
                    if (determineOverNode(propertyNode) && isPressed) {            // if not, checks if the mouse is down and the cursor is inside specified node    
                        propertyNode.active = true;                         // if is inside node and pressed sets node as active and informs global var that a node is currently active;
                        nodeIsActivated = true;
                        makePop(propertyNode.description.slice(1, -1));
                    } else {                                                //if either not in node, or not pressed, specified node stays active=false
                        propertyNode.active = false;
                    }
                }
            }


            //determines if the mouse is inside the diameter of a node
            function determineOverNode(propertyNode) {
                var isOverNode;
                var r = propertyNode.radius * 3;
                if ((mouse.x > propertyNode.x - r) && (mouse.x < propertyNode.x + r) && (mouse.y > propertyNode.y - r) && (mouse.y < propertyNode.y + r)) {
                    propertyNode.scaleX = 2;
                    propertyNode.scaleY = 2;
                    isOverNode = true;
                }
                if ((mouse.x <= propertyNode.x - r) || (mouse.x >= propertyNode.x + r) || (mouse.y <= propertyNode.y - r) && (mouse.y >= propertyNode.y + r)) {
                    propertyNode.scaleX = 1;
                    propertyNode.scaleY = 1;
                    isOverNode = false;
                }
                return isOverNode;
            }



            function isBetween(a, b, c, tolerance) {
                var distance = Math.abs((c.y - b.y) * a.x - (c.x - b.x) * a.y + c.x * b.y - c.y * b.x) / Math.sqrt(Math.pow((c.y - b.y), 2) + Math.pow((c.x - b.x), 2));
                if (distance > tolerance) {
                    return false;
                }
                //test if the point c is between a and b
                var dotproduct = (c.x - a.x) * (b.x - a.x) + (c.y - a.y) * (b.y - a.y)
                if (dotproduct < 0) {
                    return false;
                }
                var squaredlengthba = (b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y);
                if (dotproduct > squaredlengthba) {
                    return false;
                }
                return true;
            }
            
            //rendering functions
            function drawPropertyNodes() {
                for (i = 0; i < propNodes.length; i++) {
                    makeActive(propNodes[i]);
                    moveNode(propNodes[i]);
                    propNodes[i].draw(ctx);
                }
            }

            //checks if node is currently selected and moves to mouse;
            function moveNode(propertyNode) {
                if (propertyNode.active) {
                    propertyNode.x = mouse.x;
                    propertyNode.y = mouse.y;
                    //if node is end to relation
                    //the end value must be changed for that relation
                }
            }
            function makePop(description) {
                var x = parent.document.getElementById("propertyDescription");
                $(x).empty();
                $(x).append("</br>" + description);
                $("div").show();
            }
            ;
            var a = {}, b = {}, c = {};
            a.x = 100;
            a.y = 100;
            b.x = 200;
            b.y = 200;
            c.x = mouse.x;
            c.y = mouse.y;




            function drawRelations() {
                for (i = 0; i < edges.length; i++) {
                    if (isBetween(edges[i].start, edges[i].end, mouse, 5)) {
                        out.innerHTML = edges[i].formula;
                        edges[i].formula = edges[i].txt;
                        edges[i].color = 'grey';
                        edges[i].width = 3;
                    }
                    edges[i].draw(ctx);
                }
            }



            // main animation function          
             (function drawFrame() {      
                 window.requestAnimationFrame(drawFrame, canvas);   
                 ctx.clearRect(0, 0, canvas.width, canvas.height);    
                //drawSkyAndGrass(ctx);
                drawPropertyNodes();
                makeEdges();    
                drawRelations();
            }());  

         };



    </script>

    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
</body>
</html>
