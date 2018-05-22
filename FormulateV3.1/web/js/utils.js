// JavaScript Document

var utils = {};

//every mouse event records position on page. To use with canvas, however, you would have to figure the coords with the offset of the canvas on the page. Not cross platform so that is unwieldy to do inline. This function does that by taking a dom element as and arg, attaching a mousemove event handler to it and returning an object ith x and y properties.

utils.captureMouse = function (element) {
	var mouse = {x:0, y:0};
var wasClicked = false;
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
      
	element.addEventListener('click', function (event) {     
		alert();
                wasClicked=true;
	}, false); 
        
	return mouse; 
};


	

      
        


//
//utils.intersects = function (rectA, rectB) {  
// return !(rectA.x + rectA.width < rectB.x ||          
//  rectB.x + rectB.width < rectA.x ||           
// rectA.y + rectA.height < rectB.y ||            rectB.y + rectB.height < rectA.y); };
