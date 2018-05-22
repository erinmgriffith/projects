// JavaScript Document

var vector2d = function(x,y){
	var vec = {
		vx:x,							//x and y vomponents of vector stored in vx, vy
		vy:y,
			
	scale: function (scale) {			// scale object either up or down
		vec.vx *=scale;
		vec.vy *=scale;
		},
	add: function (vec2){				//adds a vector
		vec.vx += vec2.vx;
		vec.vy += vec2.vy;
		},
	sub: function (vec2){				//subtracts vector
		vec.vx -= vec2.vx;
		vec.vy -= vec2.vy;
		},
	negate: function () {				//points vector in opposite direction
		vec.vx = -vec.vx;
		vec.vy = -vec.vy;
		},
	length: function(){					// returns length of vector using pythagorus
		return Math.sqrt(vec.vx*vec.vx + vec.vy*vec.vy);
		},
	lengthSquared: function (){			//returns length squared. useful for telling if one vector is longer than another
		return vec.vx*vec.vx + vec.vy*vec.vy;
		},
	normalize: function(){				//turns the vector into a unit length vector pointing in the same direction
		var len = Math.sqrt(vec.vx*vec.vx + vec.vy*vec.vy);
		if (len){
			vec.vx/=len;
			vec.vy /=len;
			}
		return len;
		},
	rotate: function(angle){				//rotates by angle in radians
		var vx = vec.vx,
			vy = vec.vy,
			cosVal = Math.cos(angle);
			sinVal = Math.sin(angle);
		vec.vx = vx*cosVal - vy*sinVal;
		vec.vy = vx*sinVal - vy*cosVal;
		},
	toString: function(){
		return '(' + vec.vx.toFixed(3) + ',' + vec.vy.toFixed(3) + ')';
		}
	};
	return vec;
};
	
	
	
	
	
	
	