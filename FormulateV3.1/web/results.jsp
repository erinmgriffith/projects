
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
    <a href="../src/java/Controllers/SystemController.java"></a>
    <a href="../src/java/DataAccess/Relation.java" transaction-type="RESOURCE_LOCAL"></a>
    <a href="../src/java/DataAccess/Property.java" transaction-type="RESOURCE_LOCAL"></a
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


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

    </style>
    <title>Results</title>
</head>



<body >  

    <button id="demo" ">Click to Zoom.</button>

    <!--    jsp fragment, receives arrays of property, relation, and formula objects, as attributes passed from controller-->
    <%
        Property[] prop = (Property[]) request.getAttribute("properties");
        Relation[] relate = (Relation[]) request.getAttribute("relations");
        Formula[] formula = (Formula[]) request.getAttribute("formulas");
    %>


    <script>
        $("#demo").click(function () {
            alert("The paragraph was clicked.");
        });
        function myFunction() {

            var canvas = document.getElementById("my_canvas");

            if (canvas.width > 1000) {
                canvas.width = 1000;
                canvas.height = 1000;
            } else
                canvas.width = 2000;
            canvas.height = 2000;
        }


    </script>
    <!--   functions responsible for initializing the elements that will be passed to the springy ui graph -->
    <script>
        var graph = new Springy.Graph();//   initialize springy.js


// retrieve values from data fields of relations recieved in jsp and turn into javascript objects that can be passed as arguments to springy.js.
// in a perfect world this could be done more efficiently via loop, but as of yet I have not figured out how to access a variable defined in a loop 
// from inside the jstl expression that is getting the attributes from java.

        var r0 = {
            from: "<%=relate[0].getFromProperty()%>",
            to: "<%=relate[0].getToProperty()%>",
            formula: "<%=relate[0].getFormula()%>".slice(1, -1)
        };
        var r1 = {
            from: "<%=relate[1].getFromProperty()%>",
            to: "<%=relate[1].getToProperty()%>",
            formula: " <%=relate[1].getFormula()%>".slice(1, -1)
        };
        var r2 = {
            from: "<%=relate[2].getFromProperty()%>",
            to: "<%=relate[2].getToProperty()%>",
            formula: "<%=relate[2].getFormula()%>".slice(1, -1)
        };
        var r3 = {
            from: "<%=relate[3].getFromProperty()%>",
            to: "<%=relate[3].getToProperty()%>",
            formula: " <%=relate[3].getFormula()%>".slice(1, -1)
        };
        var r4 = {
            from: "<%=relate[4].getFromProperty()%>",
            to: "<%=relate[4].getToProperty()%>",
            formula: "<%=relate[4].getFormula()%>".slice(1, -1)
        };
        var r5 = {
            from: "<%=relate[5].getFromProperty()%>",
            to: "<%=relate[5].getToProperty()%>",
            formula: "<%=relate[5].getFormula()%>".slice(1, -1)
        };
        var r6 = {
            from: "<%=relate[6].getFromProperty()%>",
            to: "<%=relate[6].getToProperty()%>",
            formula: "<%=relate[6].getFormula()%>".slice(1, -1)
        };
        var r7 = {
            from: "<%=relate[7].getFromProperty()%>",
            to: "<%=relate[7].getToProperty()%>",
            formula: "<%=relate[7].getFormula()%>".slice(1, -1)
        };
        var r8 = {
            from: "<%=relate[8].getFromProperty()%>",
            to: "<%=relate[8].getToProperty()%>",
            formula: "<%=relate[8].getFormula()%>".slice(1, -1)
        };
        var r9 = {
            from: "<%=relate[9].getFromProperty()%>",
            to: "<%=relate[9].getToProperty()%>",
            formula: "<%=relate[9].getFormula()%>".slice(1, -1)
        };
        var r10 = {
            from: "<%=relate[10].getFromProperty()%>",
            to: "<%=relate[10].getToProperty()%>",
            formula: "<%=relate[10].getFormula()%>".slice(1, -1)
        };
        var r11 = {
            from: "<%=relate[11].getFromProperty()%>",
            to: "<%=relate[11].getToProperty()%>",
            formula: "<%=relate[11].getFormula()%>".slice(1, -1)
        };
        var r12 = {
            from: "<%=relate[12].getFromProperty()%>",
            to: "<%=relate[12].getToProperty()%>",
            formula: "<%=relate[12].getFormula()%>".slice(1, -1)
        };
        var r13 = {
            from: "<%=relate[13].getFromProperty()%>",
            to: "<%=relate[13].getToProperty()%>",
            formula: "<%=relate[13].getFormula()%>".slice(1, -1)
        };
        var r14 = {
            from: "<%=relate[14].getFromProperty()%>",
            to: "<%=relate[14].getToProperty()%>",
            formula: "<%=relate[14].getFormula()%>".slice(1, -1)
        };
        var r15 = {
            from: "<%=relate[15].getFromProperty()%>",
            to: "<%=relate[15].getToProperty()%>",
            formula: "<%=relate[15].getFormula()%>".slice(1, -1)
        };
        var r16 = {
            from: "<%=relate[16].getFromProperty()%>",
            to: "<%=relate[16].getToProperty()%>",
            formula: "<%=relate[16].getFormula()%>".slice(1, -1)
        };
        var r17 = {
            from: "<%=relate[17].getFromProperty()%>",
            to: "<%=relate[17].getToProperty()%>",
            formula: "<%=relate[17].getFormula()%>".slice(1, -1)
        };
        var r18 = {
            from: "<%=relate[18].getFromProperty()%>",
            to: "<%=relate[18].getToProperty()%>",
            formula: "<%=relate[18].getFormula()%>".slice(1, -1)
        };
        var r19 = {
            from: "<%=relate[19].getFromProperty()%>",
            to: "<%=relate[19].getToProperty()%>",
            formula: "<%=relate[19].getFormula()%>".slice(1, -1)
        };
        var r20 = {
            from: "<%=relate[20].getFromProperty()%>",
            to: "<%=relate[20].getToProperty()%>",
            formula: "<%=relate[20].getFormula()%>".slice(1, -1)
        };
        var r21 = {
            from: "<%=relate[21].getFromProperty()%>",
            to: "<%=relate[21].getToProperty()%>",
            formula: "<%=relate[21].getFormula()%>".slice(1, -1)
        };
        var r22 = {
            from: "<%=relate[22].getFromProperty()%>",
            to: "<%=relate[22].getToProperty()%>",
            formula: "<%=relate[22].getFormula()%>".slice(1, -1)
        };
        var r23 = {
            from: "<%=relate[23].getFromProperty()%>",
            to: "<%=relate[23].getToProperty()%>",
            formula: "<%=relate[23].getFormula()%>".slice(1, -1)
        };
        var r24 = {
            from: "<%=relate[24].getFromProperty()%>",
            to: "<%=relate[24].getToProperty()%>",
            formula: "<%=relate[24].getFormula()%>".slice(1, -1)
        };
        var r25 = {
            from: "<%=relate[25].getFromProperty()%>",
            to: "<%=relate[25].getToProperty()%>",
            formula: "<%=relate[25].getFormula()%>".slice(1, -1)
        };
        var r26 = {
            from: "<%=relate[26].getFromProperty()%>",
            to: "<%=relate[26].getToProperty()%>",
            formula: "<%=relate[26].getFormula()%>".slice(1, -1)
        };
        var r27 = {
            from: "<%=relate[27].getFromProperty()%>",
            to: "<%=relate[27].getToProperty()%>",
            formula: "<%=relate[27].getFormula()%>".slice(1, -1)
        };
        var r28 = {
            from: "<%=relate[28].getFromProperty()%>",
            to: "<%=relate[28].getToProperty()%>",
            formula: "<%=relate[28].getFormula()%>".slice(1, -1)
        };
        var r29 = {
            from: "<%=relate[29].getFromProperty()%>",
            to: "<%=relate[29].getToProperty()%>",
            formula: "<%=relate[29].getFormula()%>".slice(1, -1)
        };
        var r30 = {
            from: "<%=relate[30].getFromProperty()%>",
            to: "<%=relate[30].getToProperty()%>",
            formula: "<%=relate[30].getFormula()%>".slice(1, -1)
        };
        var r31 = {
            from: "<%=relate[31].getFromProperty()%>",
            to: "<%=relate[31].getToProperty()%>",
            formula: "<%=relate[31].getFormula()%>".slice(1, -1)
        };
        var r32 = {
            from: "<%=relate[32].getFromProperty()%>",
            to: "<%=relate[32].getToProperty()%>",
            formula: "<%=relate[32].getFormula()%>".slice(1, -1)
        };
        var r33 = {
            from: "<%=relate[33].getFromProperty()%>",
            to: "<%=relate[33].getToProperty()%>",
            formula: "<%=relate[33].getFormula()%>".slice(1, -1)
        };
        var r34 = {
            from: "<%=relate[34].getFromProperty()%>",
            to: "<%=relate[34].getToProperty()%>",
            formula: "<%=relate[34].getFormula()%>".slice(1, -1)
        };
        var r35 = {
            from: "<%=relate[35].getFromProperty()%>",
            to: "<%=relate[35].getToProperty()%>",
            formula: "<%=relate[35].getFormula()%>".slice(1, -1)
        };
        var r36 = {
            from: "<%=relate[36].getFromProperty()%>",
            to: "<%=relate[36].getToProperty()%>",
            formula: "<%=relate[36].getFormula()%>".slice(1, -1)
        };
        var r37 = {
            from: "<%=relate[37].getFromProperty()%>",
            to: "<%=relate[37].getToProperty()%>",
            formula: "<%=relate[37].getFormula()%>".slice(1, -1)
        };
        var r38 = {
            from: "<%=relate[38].getFromProperty()%>",
            to: "<%=relate[38].getToProperty()%>",
            formula: "<%=relate[38].getFormula()%>".slice(1, -1)
        };
        var r39 = {
            from: "<%=relate[39].getFromProperty()%>",
            to: "<%=relate[39].getToProperty()%>",
            formula: "<%=relate[39].getFormula()%>".slice(1, -1)
        };
        var r40 = {
            from: "<%=relate[40].getFromProperty()%>",
            to: "<%=relate[40].getToProperty()%>",
            formula: "<%=relate[40].getFormula()%>".slice(1, -1)
        };
        var r41 = {
            from: "<%=relate[41].getFromProperty()%>",
            to: "<%=relate[41].getToProperty()%>",
            formula: "<%=relate[41].getFormula()%>".slice(1, -1)
        };
        var r42 = {
            from: "<%=relate[42].getFromProperty()%>",
            to: "<%=relate[42].getToProperty()%>",
            formula: "<%=relate[42].getFormula()%>".slice(1, -1)
        };
        var r43 = {
            from: "<%=relate[43].getFromProperty()%>",
            to: "<%=relate[43].getToProperty()%>",
            formula: "<%=relate[43].getFormula()%>".slice(1, -1)
        };
        var r44 = {
            from: "<%=relate[44].getFromProperty()%>",
            to: "<%=relate[44].getToProperty()%>",
            formula: "<%=relate[44].getFormula()%>".slice(1, -1)
        };
        var r45 = {
            from: "<%=relate[45].getFromProperty()%>",
            to: "<%=relate[45].getToProperty()%>",
            formula: "<%=relate[45].getFormula()%>".slice(1, -1)
        };
        var r46 = {
            from: "<%=relate[46].getFromProperty()%>",
            to: "<%=relate[46].getToProperty()%>",
            formula: "<%=relate[46].getFormula()%>".slice(1, -1)
        };
        var r47 = {
            from: "<%=relate[47].getFromProperty()%>",
            to: "<%=relate[47].getToProperty()%>",
            formula: "<%=relate[47].getFormula()%>".slice(1, -1)
        };
        var r48 = {
            from: "<%=relate[48].getFromProperty()%>",
            to: "<%=relate[48].getToProperty()%>",
            formula: "<%=relate[48].getFormula()%>".slice(1, -1)
        };
        var r49 = {
            from: "<%=relate[49].getFromProperty()%>",
            to: "<%=relate[49].getToProperty()%>",
            formula: "<%=relate[49].getFormula()%>".slice(1, -1)
        };
        var r50 = {
            from: "<%=relate[50].getFromProperty()%>",
            to: "<%=relate[50].getToProperty()%>",
            formula: "<%=relate[50].getFormula()%>".slice(1, -1)
        };
        var r51 = {
            from: "<%=relate[51].getFromProperty()%>",
            to: "<%=relate[51].getToProperty()%>",
            formula: "<%=relate[51].getFormula()%>".slice(1, -1)
        };
        var r52 = {
            from: "<%=relate[52].getFromProperty()%>",
            to: "<%=relate[52].getToProperty()%>",
            formula: "<%=relate[52].getFormula()%>".slice(1, -1)
        };
        var r53 = {
            from: "<%=relate[53].getFromProperty()%>",
            to: "<%=relate[53].getToProperty()%>",
            formula: "<%=relate[53].getFormula()%>".slice(1, -1)
        };
        var r54 = {
            from: "<%=relate[54].getFromProperty()%>",
            to: "<%=relate[54].getToProperty()%>",
            formula: "<%=relate[54].getFormula()%>".slice(1, -1)
        };
        var r55 = {
            from: "<%=relate[55].getFromProperty()%>",
            to: "<%=relate[55].getToProperty()%>",
            formula: "<%=relate[55].getFormula()%>".slice(1, -1)
        };
        var r56 = {
            from: "<%=relate[56].getFromProperty()%>",
            to: "<%=relate[56].getToProperty()%>",
            formula: "<%=relate[56].getFormula()%>".slice(1, -1)
        };
        var r57 = {
            from: "<%=relate[57].getFromProperty()%>",
            to: "<%=relate[57].getToProperty()%>",
            formula: "<%=relate[57].getFormula()%>".slice(1, -1)
        };
        var r58 = {
            from: "<%=relate[58].getFromProperty()%>",
            to: "<%=relate[58].getToProperty()%>",
            formula: "<%=relate[58].getFormula()%>".slice(1, -1)
        };
        var r59 = {
            from: "<%=relate[59].getFromProperty()%>",
            to: "<%=relate[59].getToProperty()%>",
            formula: "<%=relate[59].getFormula()%>".slice(1, -1)
        };
        var r60 = {
            from: "<%=relate[60].getFromProperty()%>",
            to: "<%=relate[60].getToProperty()%>",
            formula: "<%=relate[60].getFormula()%>".slice(1, -1)
        };
        var r61 = {
            from: "<%=relate[61].getFromProperty()%>",
            to: "<%=relate[61].getToProperty()%>",
            formula: "<%=relate[61].getFormula()%>".slice(1, -1)
        };
        var r62 = {
            from: "<%=relate[62].getFromProperty()%>",
            to: "<%=relate[62].getToProperty()%>",
            formula: "<%=relate[62].getFormula()%>".slice(1, -1)
        };
        var r63 = {
            from: "<%=relate[63].getFromProperty()%>",
            to: "<%=relate[63].getToProperty()%>",
            formula: "<%=relate[63].getFormula()%>".slice(1, -1)
        };
        var r64 = {
            from: "<%=relate[64].getFromProperty()%>",
            to: "<%=relate[64].getToProperty()%>",
            formula: "<%=relate[64].getFormula()%>".slice(1, -1)
        };
        var r65 = {
            from: "<%=relate[65].getFromProperty()%>",
            to: "<%=relate[65].getToProperty()%>",
            formula: "<%=relate[65].getFormula()%>".slice(1, -1)
        };
        var r66 = {
            from: "<%=relate[66].getFromProperty()%>",
            to: "<%=relate[66].getToProperty()%>",
            formula: "<%=relate[66].getFormula()%>".slice(1, -1)
        };
        var r67 = {
            from: "<%=relate[67].getFromProperty()%>",
            to: "<%=relate[67].getToProperty()%>",
            formula: "<%=relate[67].getFormula()%>".slice(1, -1)
        };
        var r68 = {
            from: "<%=relate[68].getFromProperty()%>",
            to: "<%=relate[68].getToProperty()%>",
            formula: "<%=relate[68].getFormula()%>".slice(1, -1)
        };
        var r69 = {
            from: "<%=relate[69].getFromProperty()%>",
            to: "<%=relate[69].getToProperty()%>",
            formula: "<%=relate[69].getFormula()%>".slice(1, -1)
        };
        var r70 = {
            from: "<%=relate[70].getFromProperty()%>",
            to: "<%=relate[70].getToProperty()%>",
            formula: "<%=relate[70].getFormula()%>".slice(1, -1)
        };
        var r71 = {
            from: "<%=relate[71].getFromProperty()%>",
            to: "<%=relate[71].getToProperty()%>",
            formula: "<%=relate[71].getFormula()%>".slice(1, -1)
        };
        var r72 = {
            from: "<%=relate[72].getFromProperty()%>",
            to: "<%=relate[72].getToProperty()%>",
            formula: "<%=relate[72].getFormula()%>".slice(1, -1)
        };
        var r73 = {
            from: "<%=relate[73].getFromProperty()%>",
            to: "<%=relate[73].getToProperty()%>",
            formula: "<%=relate[73].getFormula()%>".slice(1, -1)
        };
        var r74 = {
            from: "<%=relate[74].getFromProperty()%>",
            to: "<%=relate[74].getToProperty()%>",
            formula: "<%=relate[74].getFormula()%>".slice(1, -1)
        };
        var r75 = {
            from: "<%=relate[75].getFromProperty()%>",
            to: "<%=relate[75].getToProperty()%>",
            formula: "<%=relate[75].getFormula()%>".slice(1, -1)
        };
        var r76 = {
            from: "<%=relate[76].getFromProperty()%>",
            to: "<%=relate[76].getToProperty()%>",
            formula: "<%=relate[76].getFormula()%>".slice(1, -1)
        };
        var r77 = {
            from: "<%=relate[77].getFromProperty()%>",
            to: "<%=relate[77].getToProperty()%>",
            formula: "<%=relate[77].getFormula()%>".slice(1, -1)
        };






// create js array of js objects that represent data from the property java class
        var p0 = {
            pid: "<%=prop[0].getID()%>",
            abbreviation: "<%=prop[0].getAbbreviation().toString()%>",
            name: "<%=prop[0].getName().toString()%>",
            description: "<%=prop[0].getDescription().toString()%>"
        };
        var p1 = {
            pid: "<%=prop[1].getID()%>",
            abbreviation: "<%=prop[1].getAbbreviation().toString()%>",
            name: "<%=prop[1].getName().toString()%>",
            description: "<%=prop[1].getDescription().toString()%>"
        };
        var p2 = {
            pid: "<%=prop[2].getID()%>",
            abbreviation: "<%=prop[2].getAbbreviation().toString()%>",
            name: "<%=prop[2].getName().toString()%>",
            description: "<%=prop[2].getDescription().toString()%>",
        };
        var p3 = {
            pid: "<%=prop[3].getID()%>",
            abbreviation: "<%=prop[3].getAbbreviation().toString()%>",
            name: "<%=prop[3].getName().toString()%>",
            description: "<%=prop[3].getDescription().toString()%>",
        };
        var p4 = {
            pid: "<%=prop[4].getID()%>",
            abbreviation: "<%=prop[4].getAbbreviation().toString()%>",
            name: "<%=prop[4].getName().toString()%>",
            description: "<%=prop[4].getDescription().toString()%>"
        };
        var p5 = {
            pid: "<%=prop[5].getID()%>",
            abbreviation: "<%=prop[5].getAbbreviation()%>",
            name: "<%=prop[5].getName().toString()%>",
            description: "<%=prop[5].getDescription().toString()%>"
        };
        var p6 = {
            pid: "<%=prop[6].getID()%>",
            abbreviation: "<%=prop[6].getAbbreviation()%>",
            name: "<%=prop[6].getName().toString()%>",
            description: "<%=prop[6].getDescription().toString()%>"
        };
        var p7 = {
            pid: "<%=prop[7].getID()%>",
            abbreviation: "<%=prop[7].getAbbreviation()%>",
            name: "<%=prop[7].getName().toString()%>",
            description: "<%=prop[7].getDescription().toString()%>"
        };
        var p8 = {
            pid: "<%=prop[8].getID()%>",
            abbreviation: "<%=prop[8].getAbbreviation()%>",
            name: "<%=prop[8].getName().toString()%>",
            description: "<%=prop[8].getDescription().toString()%>"
        };
        var p9 = {
            pid: "<%=prop[9].getID()%>",
            abbreviation: "<%=prop[9].getAbbreviation()%>",
            name: "<%=prop[9].getName().toString()%>",
            description: "<%=prop[9].getDescription().toString()%>"
        };
        var p10 = {
            pid: "<%=prop[10].getID()%>",
            abbreviation: "<%=prop[10].getAbbreviation()%>",
            name: "<%=prop[10].getName().toString()%>",
            description: "<%=prop[10].getDescription().toString()%>"
        };
        var p11 = {
            pid: "<%=prop[11].getID()%>",
            abbreviation: "<%=prop[11].getAbbreviation()%>",
            name: "<%=prop[11].getName().toString()%>",
            description: "<%=prop[11].getDescription().toString()%>"
        };
        var p12 = {
            pid: "<%=prop[12].getID()%>",
            abbreviation: "<%=prop[12].getAbbreviation()%>",
            name: "<%=prop[12].getName().toString()%>",
            description: "<%=prop[12].getDescription().toString()%>",
            id: 12
        };
        var p13 = {
            pid: "<%=prop[13].getID()%>",
            abbreviation: "<%=prop[13].getAbbreviation()%>",
            name: "<%=prop[13].getName().toString()%>",
            description: "<%=prop[13].getDescription().toString()%>"
        };
        var p14 = {
            pid: "<%=prop[14].getID()%>",
            abbreviation: "<%=prop[14].getAbbreviation()%>",
            name: "<%=prop[14].getName().toString()%>",
            description: "<%=prop[14].getDescription().toString()%>"
        };
        var p15 = {
            pid: "<%=prop[15].getID()%>",
            abbreviation: "<%=prop[15].getAbbreviation()%>",
            name: "<%=prop[15].getName().toString()%>",
            description: "<%=prop[15].getDescription().toString()%>"
        };
        var p16 = {
            pid: "<%=prop[16].getID()%>",
            abbreviation: " <%=prop[16].getAbbreviation()%>",
            name: "<%=prop[16].getName().toString()%>",
            description: "<%=prop[16].getDescription().toString()%>"
        };
        var p17 = {
            pid: "<%=prop[17].getID()%>",
            abbreviation: "<%=prop[17].getAbbreviation()%>",
            name: "<%=prop[17].getName().toString()%>",
            description: "<%=prop[17].getDescription().toString()%>"
        };
        var p18 = {
            pid: "<%=prop[18].getID()%>",
            abbreviation: "<%=prop[18].getAbbreviation()%>",
            name: "<%=prop[18].getName().toString()%>",
            description: "<%=prop[18].getDescription().toString()%>"
        };
        var p19 = {
            pid: "<%=prop[19].getID()%>",
            abbreviation: "<%=prop[19].getAbbreviation()%>",
            name: "<%=prop[19].getName().toString()%>",
            description: "<%=prop[19].getDescription().toString()%>"
        };
        var p20 = {
            pid: "<%=prop[20].getID()%>",
            abbreviation: "<%=prop[20].getAbbreviation()%>",
            name: "<%=prop[20].getName().toString()%>",
            description: "<%=prop[20].getDescription().toString()%>"
        };



// retrieves a div element from the parent index page and turns it into a jquery object that can be toggled and change content.
// // receives property description as an argument and then appendis it to the div in the index page.
        function makePop(description) {
            var x = parent.document.getElementById("propertyDescription");
            $(x).empty();
            $(x).append("</br>" + description);
            $("div").show();
        };
        function makeForm(description) {
            alert();
//            var x = parent.document.getElementById("propertyDescription");
//            $(x).empty();
//            $(x).append("</br>" + description);
//            $("div").show();
        }
        ;
// creates instances of Springy.node objects representing properties and including on double click function calls to makePop()

        var n0 = graph.newNode({label: p0.name, ondoubleclick: function () {
                makePop(p0.description.slice(1, -1));
            }});
        var n1 = graph.newNode({label: p1.name, ondoubleclick: function () {
                makePop(p1.description.slice(1, -1));
            }});
        var n2 = graph.newNode({label: p2.name, ondoubleclick: function () {
                makePop(p2.description.slice(1, -1));
            }});
        var n3 = graph.newNode({label: p3.name, ondoubleclick: function () {
                makePop(p3.description.slice(1, -1));
            }});
        var n4 = graph.newNode({label: p4.name, ondoubleclick: function () {
                makePop(p4.description.slice(1, -1));
            }});
        var n5 = graph.newNode({label: p5.name, ondoubleclick: function () {
                makePop(p5.description.slice(1, -1));
            }});
        var n6 = graph.newNode({label: p6.name, ondoubleclick: function () {
                makePop(p6.description.slice(1, -1));
            }});
        var n7 = graph.newNode({label: p7.name, ondoubleclick: function () {
                makePop(p7.description.slice(1, -1));
            }});
        var n8 = graph.newNode({label: p8.name, ondoubleclick: function () {
                makePop(p8.description.slice(1, -1));
            }});
        var n9 = graph.newNode({label: p9.name, ondoubleclick: function () {
                makePop(p9.description.slice(1, -1));
            }});
        var n10 = graph.newNode({label: p10.name, ondoubleclick: function () {
                makePop(p10.description.slice(1, -1));
            }});
        var n11 = graph.newNode({label: p11.name, ondoubleclick: function () {
                makePop(p11.description.slice(1, -1));
            }});
        var n12 = graph.newNode({label: p12.name, ondoubleclick: function () {
                makePop(p12.description.slice(1, -1));
            }});
        var n13 = graph.newNode({label: p13.name, ondoubleclick: function () {
                makePop(p13.description.slice(1, -1));
            }});
        var n14 = graph.newNode({label: p14.name, ondoubleclick: function () {
                makePop(p14.description.slice(1, -1));
            }});
        var n15 = graph.newNode({label: p15.name, ondoubleclick: function () {
                makePop(p15.description.slice(1, -1));
            }});
        var n16 = graph.newNode({label: p16.name, ondoubleclick: function () {
                makePop(p16.description.slice(1, -1));
            }});
        var n17 = graph.newNode({label: p17.name, ondoubleclick: function () {
                makePop(p17.description.slice(1, -1));
            }});
        var n18 = graph.newNode({label: p18.name, ondoubleclick: function () {
                makePop(p18.description.slice(1, -1));
            }});
        var n19 = graph.newNode({label: p19.name, ondoubleclick: function () {
                makePop(p19.description.slice(1, -1));
            }});
        var n20 = graph.newNode({label: p20.name, ondoubleclick: function () {
                makePop(p20.description.slice(1, -1));
            }});



// loops through property array and finds the index of the property that corresponds to the from property of a relation
//  uses that index to return the node that the edge should start from.
        function findFrom(fr) {
            var fromNode;
            for (i = 0; i < p.length; i++) {
                if ((p[i].pid).search(fr) !== -1) {
                    fromNode = n[i];
                    break;
                }
            }
            return fromNode;
        }

// loops through property array and finds the index of the property that corresponds to the to property of a relation
//  uses that index to return the node that the edge should go to.
        function findTo(tr) {
            var toNode;
            for (j = 0; j < p.length; j++) {
                if (p[j].pid.search(tr) !== -1) {
                    toNode = n[j];
                    break;
                }
            }
            return toNode;
        }




        var p = [p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20];
        var n = [n0, n1, n2, n3, n4, n5, n6, n7, n8, n10, n11, n12, n16, n14, n15, n16, n17, n18, n19, n20];
        var r = [r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, r32, r33, r34, r35, r36, r37, r38, r39, r40, r41, r42, r43,
            r44, r45, r46, r47, r48, r49, r50, r51, r52, r53, r54, r55, r56, r57, r58, r59, r60, r61, r62, r63, r64, r65, r66, r67, r68, r69, r70, r71, r72, r73, r74, r75, r76, r77];




//creates instances of Springy.edge objects that pass the two node objects that represent that relation's to and from properties
// and a formula string that each edge represents
        var e0 = graph.newEdge(findFrom(r0.from), findTo(r0.to), {label: r0.formula});
        var e1 = graph.newEdge(findFrom(r1.from), findTo(r1.to), {label: r1.formula});
        var e2 = graph.newEdge(findFrom(r2.from), findTo(r2.to), {label: r2.formula});
        var e3 = graph.newEdge(findFrom(r3.from), findTo(r3.to), {label: r3.formula});
        //       var e4 = graph.newEdge(findFrom(r4.from), findTo(r4.to), {label: r4.formula});
        var e5 = graph.newEdge(findFrom(r5.from), findTo(r5.to), {label: r5.formula});
        var e6 = graph.newEdge(findFrom(r6.from), findTo(r6.to), {label: r6.formula});
        var e7 = graph.newEdge(findFrom(r7.from), findTo(r7.to), {label: r7.formula});
        var e8 = graph.newEdge(findFrom(r8.from), findTo(r8.to), {label: r8.formula});
        var e9 = graph.newEdge(findFrom(r9.from), findTo(r9.to), {label: r9.formula});
        var e10 = graph.newEdge(findFrom(r10.from), findTo(r10.to), {label: r10.formula});
        var e11 = graph.newEdge(findFrom(r11.from), findTo(r11.to), {label: r11.formula});
        var e12 = graph.newEdge(findFrom(r12.from), findTo(r12.to), {label: r12.formula});
        var e13 = graph.newEdge(findFrom(r13.from), findTo(r13.to), {label: r13.formula});
        var e14 = graph.newEdge(findFrom(r14.from), findTo(r14.to), {label: r14.formula});
        var e15 = graph.newEdge(findFrom(r15.from), findTo(r15.to), {label: r15.formula});
        var e16 = graph.newEdge(findFrom(r16.from), findTo(r16.to), {label: r16.formula});
        // var e17 = graph.newEdge(findFrom(r17.from), findTo(r17.to), {label: r17.formula});
        var e18 = graph.newEdge(findFrom(r18.from), findTo(r18.to), {label: r18.formula});
        var e19 = graph.newEdge(findFrom(r19.from), findTo(r19.to), {label: r19.formula});
        var e20 = graph.newEdge(findFrom(r20.from), findTo(r20.to), {label: r20.formula});
        var e21 = graph.newEdge(findFrom(r21.from), findTo(r21.to), {label: r21.formula});
        var e22 = graph.newEdge(findFrom(r22.from), findTo(r22.to), {label: r22.formula});
        var e23 = graph.newEdge(findFrom(r23.from), findTo(r23.to), {label: r23.formula});
        var e24 = graph.newEdge(findFrom(r24.from), findTo(r24.to), {label: r24.formula});
        var e25 = graph.newEdge(findFrom(r25.from), findTo(r25.to), {label: r25.formula});
        var e26 = graph.newEdge(findFrom(r26.from), findTo(r26.to), {label: r26.formula});
        var e27 = graph.newEdge(findFrom(r27.from), findTo(r27.to), {label: r27.formula});
        var e28 = graph.newEdge(findFrom(r28.from), findTo(r28.to), {label: r28.formula});
        var e29 = graph.newEdge(findFrom(r29.from), findTo(r29.to), {label: r29.formula});
        var e30 = graph.newEdge(findFrom(r30.from), findTo(r30.to), {label: r30.formula});
        var e31 = graph.newEdge(findFrom(r31.from), findTo(r31.to), {label: r31.formula});
        var e32 = graph.newEdge(findFrom(r32.from), findTo(r32.to), {label: r32.formula});
        var e33 = graph.newEdge(findFrom(r33.from), findTo(r33.to), {label: r33.formula});
        var e34 = graph.newEdge(findFrom(r34.from), findTo(r34.to), {label: r34.formula});
        var e35 = graph.newEdge(findFrom(r35.from), findTo(r35.to), {label: r35.formula});
        var e36 = graph.newEdge(findFrom(r36.from), findTo(r36.to), {label: r36.formula});
        var e37 = graph.newEdge(findFrom(r37.from), findTo(r37.to), {label: r37.formula});
        var e38 = graph.newEdge(findFrom(r38.from), findTo(r38.to), {label: r38.formula});
        var e39 = graph.newEdge(findFrom(r39.from), findTo(r39.to), {label: r39.formula});
        var e40 = graph.newEdge(findFrom(r40.from), findTo(r40.to), {label: r40.formula});
        var e41 = graph.newEdge(findFrom(r41.from), findTo(r41.to), {label: r41.formula});
        var e42 = graph.newEdge(findFrom(r42.from), findTo(r42.to), {label: r42.formula});
        var e43 = graph.newEdge(findFrom(r43.from), findTo(r43.to), {label: r43.formula});
        var e44 = graph.newEdge(findFrom(r44.from), findTo(r44.to), {label: r44.formula});
        var e45 = graph.newEdge(findFrom(r45.from), findTo(r45.to), {label: r45.formula});
        var e46 = graph.newEdge(findFrom(r46.from), findTo(r46.to), {label: r46.formula});
        graph.newEdge(findFrom(r47.from), findTo(r47.to), {label: r47.formula});
        graph.newEdge(findFrom(r48.from), findTo(r48.to), {label: r48.formula});
        graph.newEdge(findFrom(r49.from), findTo(r49.to), {label: r49.formula});
        graph.newEdge(findFrom(r50.from), findTo(r50.to), {label: r50.formula});
        graph.newEdge(findFrom(r51.from), findTo(r51.to), {label: r51.formula});
        graph.newEdge(findFrom(r52.from), findTo(r52.to), {label: r52.formula});
        graph.newEdge(findFrom(r53.from), findTo(r53.to), {label: r53.formula});
        graph.newEdge(findFrom(r54.from), findTo(r54.to), {label: r54.formula});
        graph.newEdge(findFrom(r55.from), findTo(r55.to), {label: r55.formula});
        graph.newEdge(findFrom(r56.from), findTo(r56.to), {label: r56.formula});
        graph.newEdge(findFrom(r57.from), findTo(r57.to), {label: r57.formula});
        graph.newEdge(findFrom(r58.from), findTo(r58.to), {label: r58.formula});
        graph.newEdge(findFrom(r59.from), findTo(r59.to), {label: r59.formula});
        graph.newEdge(findFrom(r60.from), findTo(r60.to), {label: r60.formula});
        graph.newEdge(findFrom(r61.from), findTo(r61.to), {label: r61.formula});
        graph.newEdge(findFrom(r62.from), findTo(r62.to), {label: r62.formula});
        graph.newEdge(findFrom(r63.from), findTo(r63.to), {label: r63.formula});
        graph.newEdge(findFrom(r64.from), findTo(r64.to), {label: r64.formula});
        graph.newEdge(findFrom(r65.from), findTo(r65.to), {label: r65.formula});
        graph.newEdge(findFrom(r66.from), findTo(r66.to), {label: r66.formula});
        graph.newEdge(findFrom(r67.from), findTo(r67.to), {label: r67.formula});
        //   graph.newEdge(findFrom(r68.from), findTo(r68.to), {label: r68.formula});
        graph.newEdge(findFrom(r69.from), findTo(r69.to), {label: r68.formula});
        graph.newEdge(findFrom(r70.from), findTo(r70.to), {label: r69.formula});
        graph.newEdge(findFrom(r71.from), findTo(r71.to), {label: r70.formula});
        graph.newEdge(findFrom(r72.from), findTo(r72.to), {label: r71.formula});
        graph.newEdge(findFrom(r73.from), findTo(r73.to), {label: r72.formula});
        graph.newEdge(findFrom(r74.from), findTo(r74.to), {label: r73.formula});




//testing methods
        function printRelation() {
            for (i = 0; i < r.length; i++) {
                console.log(i + " from: " + r[i].from + " to: " + r[i].to + " formula " + r[i].formula );
            }
        }
        function printProperty() {
            for (i = 0; i < p.length; i++) {
                document.writeln(i + " pid " + p[i].pid + "<br>");
            }
        }




    </script>
    <canvas id="my_canvas" width="1000" height="1000" ></canvas>

    <script>
//        calls springy ui
printRelation();

        $('#my_canvas').springy({graph: graph});
    </script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
</body>
</html>
