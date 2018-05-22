/**
 Copyright (c) 2010 Dennis Hotson
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 */

(function () {
    jQuery.fn.springy = function (params) {
        var graph = this.graph = params.graph || new springy.Graph(); //springy recently changed to lowercase
        var nodeFont = "12px Verdana, sans-serif";
        var edgeFont = "12px Verdana, sans-serif";
        var stiffness = params.stiffness || 1.0;
        var repulsion = params.repulsion || 200.0;
        var damping = params.damping || .5;
        var minEnergyThreshold = params.minEnergyThreshold || 0.00001;
        var nodeSelected = params.nodeSelected || null;
                var edgeSelected = params.edgeSelected || null;

        var nodeImages = {};
        var edgeLabelsUpright = true;
        var canvas = this[0];
        var ctx = canvas.getContext("2d");

        var layout = this.layout = new springy.Layout.ForceDirected(graph, stiffness, repulsion, damping, minEnergyThreshold);

        // calculate bounding box of graph layout.. with ease-in
        var currentBB = layout.getBoundingBox();
        var targetBB = {bottomleft: new springy.Vector(-2, -2), topright: new springy.Vector(2, 2)};

        // auto adjusting bounding box
        springy.requestAnimationFrame(function adjust() {
            targetBB = layout.getBoundingBox();
            // current gets 20% closer to target every iteration
            currentBB = {
                bottomleft: currentBB.bottomleft.add(targetBB.bottomleft.subtract(currentBB.bottomleft)
                        .divide(10)),
                topright: currentBB.topright.add(targetBB.topright.subtract(currentBB.topright)
                        .divide(10))
            };

            springy.requestAnimationFrame(adjust);
        });

        // convert to/from screen coordinates
        var toScreen = function (p) {
            var size = currentBB.topright.subtract(currentBB.bottomleft);
            var sx = p.subtract(currentBB.bottomleft).divide(size.x).x * canvas.width;
            var sy = p.subtract(currentBB.bottomleft).divide(size.y).y * canvas.height;
            return new springy.Vector(sx, sy);
        };

        var fromScreen = function (s) {
            var size = currentBB.topright.subtract(currentBB.bottomleft);
            var px = (s.x / canvas.width) * size.x + currentBB.bottomleft.x;
            var py = (s.y / canvas.height) * size.y + currentBB.bottomleft.y;
            return new springy.Vector(px, py);
        };

        // half-assed drag and drop
        var selected = null;
        var nearest = null;
        var dragged = null;
        var isOver = null;
        jQuery(canvas).mousedown(function (e) {
            var pos = jQuery(this).offset();
            var p = fromScreen({x: e.pageX - pos.left, y: e.pageY - pos.top});
            selected = nearest = dragged = layout.nearest(p);

            if (selected.node !== null) {
                dragged.point.m = 10000.0;

                if (nodeSelected) {
                    nodeSelected(selected.node);
                }
            }
  if (selected.edge !== null) {

                if (edgeSelected) {
                    edgeSelected(selected.edge);
                }
            }
            renderer.start();
        });

        // Basic double click handler
        jQuery(canvas).dblclick(function (e) {
          
            var pos = jQuery(this).offset();
            var p = fromScreen({x: e.pageX - pos.left, y: e.pageY - pos.top});
            selected = layout.nearest(p);
            edge = selected.edge;
            node = selected.node;
            if (node && node.data && node.data.ondoubleclick) {
                node.data.ondoubleclick();
            }
            if (edge && edge.data && edge.data.ondoubleclick) {
                edge.data.ondoubleclick();
            }
        });

        jQuery(canvas).mousemove(function (e) {
            var pos = jQuery(this).offset();
            var p = fromScreen({x: e.pageX - pos.left, y: e.pageY - pos.top});
            nearest = layout.nearest(p);

            if (dragged !== null && dragged.node !== null) {
                dragged.point.p.x = p.x;
                dragged.point.p.y = p.y;
            }

            renderer.start();
        });

        jQuery(canvas).mouseenter(function (e) {
            var pos = jQuery(this).offset();
            var p = fromScreen({x: e.pageX - pos.left, y: e.pageY - pos.top});
            isOver = layout.nearest(p);
            edge = isOver.edge;
            if (dragged !== null && dragged.node !== null) {
                dragged.point.p.x = p.x;
                dragged.point.p.y = p.y;
            }

            renderer.start();
        })
        jQuery(window).bind('mouseup', function (e) {
            dragged = null;
        });

        var getTextWidth = function (node) {
            var text = (node.data.label !== undefined) ? node.data.label : node.id;
            if (node._width && node._width[text])
                return node._width[text];

            ctx.save();
            ctx.font = (node.data.font !== undefined) ? node.data.font : nodeFont;
            var width = ctx.measureText(text).width;
            ctx.restore();

            node._width || (node._width = {});
            node._width[text] = width;

            return width;
        };

        var getTextHeight = function (node) {
            return 16;
            // In a more modular world, this would actually read the font size, but I think leaving it a constant is sufficient for now.
            // If you change the font size, I'd adjust this too.
        };

        var getImageWidth = function (node) {
            var width = (node.data.image.width !== undefined) ? node.data.image.width : nodeImages[node.data.image.src].object.width;
            return width;
        }

        var getImageHeight = function (node) {
            var height = (node.data.image.height !== undefined) ? node.data.image.height : nodeImages[node.data.image.src].object.height;
            return height;
        }

        Springy.Node.prototype.getHeight = function () {
            var height;
            if (this.data.image === undefined) {
                height = getTextHeight(this);
            } else {
                if (this.data.image.src in nodeImages && nodeImages[this.data.image.src].loaded) {
                    height = getImageHeight(this);
                } else {
                    height = 10;
                }
            }
            return height;
        }

        Springy.Node.prototype.getWidth = function () {
            var width;
            if (this.data.image === undefined) {
                width = getTextWidth(this);
            } else {
                if (this.data.image.src in nodeImages && nodeImages[this.data.image.src].loaded) {
                    width = getImageWidth(this);
                } else {
                    width = 10;
                }
            }
            return width;
        }

        var renderer = this.renderer = new Springy.Renderer(layout,
                function clear() {
                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                },
                function drawEdge(edge, p1, p2) {
                    var x1 = toScreen(p1).x;
                    var y1 = toScreen(p1).y;
                    var x2 = toScreen(p2).x;
                    var y2 = toScreen(p2).y;

                    var direction = new Springy.Vector(x2 - x1, y2 - y1);
                    var normal = direction.normal().normalise();

                    var from = graph.getEdges(edge.source, edge.target);
                    var to = graph.getEdges(edge.target, edge.source);

                    var total = from.length + to.length ;

                    // Figure out edge's position in relation to other edges between the same nodes
                    var n = 0;
                    for (var i = 0; i < from.length; i++) {
                        if (from[i].id === edge.id) {
                            n = i;
                        }
                    }

                    for (var i = 0; i < from.length; i++) {
                        if (from[i].id === undefined) {
                            edge.id = i.toString();
                        } else
                            edge.id = from[i].id;


                    }

                    //change default to  10.0 to allow text fit between edges
                    var spacing = 35.0;

                    // Figure out how far off center the line should be drawn
                   var offset = normal.multiply(-((total - 1) * spacing) / 4 + (n * spacing));

                    var paddingX = 6;
                    var paddingY = 6;

                    var s1 = toScreen(p1).add(offset);
                    var s2 = toScreen(p2).add(offset);

                    var boxWidth = 300;
                    var boxHeight = 200;

                    var intersection = intersect_line_box(s1, s2, {x: x2 - boxWidth / 2.0, y: y2 - boxHeight / 2.0}, boxWidth, boxHeight);

                    if (!intersection) {
                        intersection = s2;
                    }

                    var stroke = (edge.data.color !== undefined) ? edge.data.color : '#ff0000';

                    var arrowWidth;
                    var arrowLength;
                    
//                    if ( selected !== null && selected.edge !== null) {
//                        ctx.fillStyle = "#FFFFE0";
//
//alert("selected");
//
//
//                     //   this.data = selected.edge.data;
//                    } else if (nearest !== null && nearest.edge !== null) {
//alert("nearest");
//                    } else {
//                        ctx.fillStyle = "#FFFFFF";
//                    }
                    var weight = (edge.data.weight !== undefined) ? edge.data.weight : 1.0;
                 
                    arrowWidth = 1 + ctx.lineWidth;
                    arrowLength = 8;

                    var directional = (edge.data.directional !== undefined) ? edge.data.directional : true;

                    // line
                    var lineEnd;
                    if (directional) {
                        lineEnd = intersection.subtract(direction.normalise().multiply(arrowLength * 0.5));
                    } else {
                        lineEnd = s2;
                    }

                    ctx.strokeStyle = stroke;
                    ctx.lineWidth=2;
                    ctx.beginPath();
                    ctx.moveTo(s1.x, s1.y);
                    ctx.lineTo(lineEnd.x, lineEnd.y);
                    ctx.stroke();

                    // arrow
                    if (directional) {
                        ctx.save();
                        ctx.fillStyle = stroke;
                        ctx.translate(intersection.x, intersection.y);
                        ctx.rotate(Math.atan2(y2 - y1, x2 - x1));
                        ctx.beginPath();
                        ctx.moveTo(-arrowLength, arrowWidth);
                        ctx.lineTo(0, 0);
                        ctx.lineTo(-arrowLength, -arrowWidth);
                        ctx.lineTo(-arrowLength * 0.8, -0);
                        ctx.closePath();
                        ctx.fill();
                        ctx.restore();
                    }
// fill background


                    // label
                    if (edge.data.label !== undefined) {
                        text = edge.data.label
                        ctx.save();
                        ctx.textAlign = "left";
                        ctx.textBaseline = "top";

                        ctx.font = (edge.data.font !== undefined) ? edge.data.font : edgeFont;
                        ctx.fillStyle = stroke;
                        var angle = Math.atan2(s2.y - s1.y, s2.x - s1.x);
                        var displacement = -8;
                        if (edgeLabelsUpright && (angle > Math.PI / 2 || angle < -Math.PI / 2)) {
                            displacement = 8;
                            angle += Math.PI;
                        }
                        var textPos = s1.add(s2).divide(2).add(normal.multiply(displacement));
                        ctx.translate(textPos.x, textPos.y);
                        ctx.rotate(angle);
                        ctx.fillStyle="#ff0000";
ctx.strokeStyle="#ff0000";
                        ctx.fillText(text, 0, -2);
                        ctx.restore();
                    }

                },
                function drawNode(node, p) {
                    var s = toScreen(p);

                    ctx.save();

                    // Pulled out the padding aspect sso that the size functions could be used in multiple places
                    // These should probably be settable by the user (and scoped higher) but this suffices for now
                    var paddingX = 0;
                    var paddingY =0;

                    var contentWidth = node.getWidth();
                    var contentHeight = node.getHeight();
                    var boxWidth = contentWidth + paddingX;
                    var boxHeight = contentHeight + paddingY;

                    // clear background
                    ctx.clearRect(s.x - boxWidth / 2, s.y - boxHeight / 2, boxWidth, boxHeight);

                    // fill background
                
                    
                    ctx.strokeStyle = "#ff0000";
                    ctx.lineWidth = 1;
   ctx.fillStyle = "#ff0000";
                    ctx.fillRect((s.x - boxWidth / 2), s.y - boxHeight / 2, boxWidth * 2 + 5, boxHeight * 2 + 5);
                    ctx.fillStyle = "#eeeeee";

                     ctx.fillRect((s.x - boxWidth / 2), s.y - boxHeight / 2, boxWidth * 2 , boxHeight * 2 );

                    ctx.strokeRect(s.x - boxWidth / 2, s.y - boxHeight / 2, boxWidth * 2 , boxHeight * 2);
                                     

                    if (node.data.image == undefined) {
                        ctx.textAlign = "left";
                        ctx.textBaseline = "top";
                        ctx.font = (node.data.font !== undefined) ? node.data.font : nodeFont;
                          ctx.font = 'bold 14px Verdana';

                        if (selected !== null && selected.node !== null && selected.node.id === node.id) {
                            ctx.fillStyle = "#ff0000";
                        ctx.font = 'bold 14px Verdana';

                            this.data = selected.node.data;
                        } else if (nearest !== null && nearest.node !== null && nearest.node.id === node.id) {
                            ctx.fillStyle = "#ff0000";
                        ctx.font = 'bold 14px Verdana';

                        } else {
                            ctx.fillStyle = "#ff0000";
                          ctx.font = 'bold 14px Verdana';

                        }
                    
                    
                      //  ctx.fillStyle = (node.data.color !== undefined) ? node.data.color : "#000000";
                        var text = (node.data.label !== undefined) ? node.data.label : node.id;
                        ctx.fillText(text, s.x - contentWidth / 4, s.y - contentHeight / 2);
                               ctx.strokeStyle = "#ff0000";
                               ctx.lineWidth =.25;
                        ctx.strokeText(  text, s.x - contentWidth / 6, s.y - contentHeight / 2);
 
                    } else {
                        // Currently we just ignore any labels if the image object is set. One might want to extend this logic to allow for both, or other composite nodes.
                        var src = node.data.image.src;  // There should probably be a sanity check here too, but un-src-ed images aren't exaclty a disaster.
                        if (src in nodeImages) {
                            if (nodeImages[src].loaded) {
                                // Our image is loaded, so it's safe to draw
                                ctx.drawImage(nodeImages[src].object, s.x - contentWidth / 2, s.y - contentHeight / 2, contentWidth, contentHeight);
                            }
                        } else {
                            // First time seeing an image with this src address, so add it to our set of image objects
                            // Note: we index images by their src to avoid making too many duplicates
                            nodeImages[src] = {};
                            var img = new Image();
                            nodeImages[src].object = img;
                            img.addEventListener("load", function () {
                                // HTMLImageElement objects are very finicky about being used before they are loaded, so we set a flag when it is done
                                nodeImages[src].loaded = true;
                            });
                            img.src = src;
                        }
                    }
                    ctx.restore();
                }
        );

        renderer.start();

        // helpers for figuring out where to draw arrows
        function intersect_line_line(p1, p2, p3, p4) {
            var denom = ((p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y));
            // lines are parallel
            if (denom === 0) {
                return false;
            }
            var ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x)) / denom;
            var ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)) / denom;

            if (ua < 0 || ua > 1 || ub < 0 || ub > 1) {
                return false;
            }
            return new Springy.Vector(p1.x + ua * (p2.x - p1.x), p1.y + ua * (p2.y - p1.y));
        }

        function intersect_line_box(p1, p2, p3, w, h) {
            var tl = {x: p3.x, y: p3.y};
            var tr = {x: p3.x + w, y: p3.y};
            var bl = {x: p3.x, y: p3.y + h};
            var br = {x: p3.x + w, y: p3.y + h};

            var result;
            if (result = intersect_line_line(p1, p2, tl, tr)) {
                return result;
            } // top
            if (result = intersect_line_line(p1, p2, tr, br)) {
                return result;
            } // right
            if (result = intersect_line_line(p1, p2, br, bl)) {
                return result;
            } // bottom
            if (result = intersect_line_line(p1, p2, bl, tl)) {
                return result;
            } // left

            return false;
        }

        return this;
    }

})();
