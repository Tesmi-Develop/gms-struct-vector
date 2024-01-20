enum vector2_dir {
	down,
	left,
	one,
	right,
	up,
	negone
}

#macro vector2_zero new Vector2(0, 0)
#macro vector2_one new Vector2(1, 1)
#macro vector2_up new Vector2(0, -1)
#macro vector2_down new Vector2(0, 1)
#macro vector2_left new Vector2(-1, 0)
#macro vector2_right new Vector2(1, 0)

function normilize(vector) {
	if (vector.Magnitude == 0) {
		return vector;
	}
	
	if (vector.x == (x / vector.Magnitude) && vector.y == (y / vector.Magnitude)) {
		return vector;
	}
	
	return new Vector2(x / vector.Magnitude, y / vector.Magnitude);
}

/// @param {Real} angle
/// @param {Bool} radians
/// @return {Id.Instance<Struct.Vector2>}
function vector2_from_angle(angle, radians = false) {
	var _x = radians ? arccos(angle) : darccos(angle);
	var _y = radians ? arcsin(angle) : darcsin(angle);
	return new Vector2(_x, _y);
}

/// @param {Real} x
/// @param {Real} y
function Vector2(x = 0, y = 0) constructor {
	self.x = x;
	self.y = y;
	self.Magnitude = sqrt(x*x + y*y);
	self.Unit = Normilize(self);

	/// @param {Struct.Vector2} vector
	static equals = function(vector) {
		return x == vector.x && y == vector.y;
	}

	/// @return {Struct.Vector2}
	static get_negative = function() {
	    return new Vector2(-x, -y);
	}
	
	/// @param {Real} x
	/// @param {Real} y
	/// @return {Id.Instance<Struct.Vector2>}
	static sadd = function(x, y) {
		return new Vector2(self.x + x, self.y + y);
	}
	
	/// @param {Struct.Vector2} vector
	/// @return {Id.Instance<Struct.Vector2>}
	static add = function(vector) {
		return new Vector2(x + vector.x, y + vector.y);
	}
	
	/// @param {Real} x
	/// @param {Real} y
	/// @return {Id.Instance<Struct.Vector2>}
	static ssub = function(x, y) {
		return sadd(-x, -y);
	}

	/// @param {Struct.Vector2} vector
	/// @return {Id.Instance<Struct.Vector2>}
	static sub = function(vector) {
		return add(vector.get_negative());
	}

	/// @param {Real} x
	/// @param {Real} y
	/// @return {Id.Instance<Struct.Vector2>}
	static smulti = function(x, y) {
		return new Vector2(self.x * x, self.y * y);
	}

	/// @param {Struct.Vector2} vector
	/// @return {Id.Instance<Struct.Vector2>}
	static multi = function(vector) {
		return new Vector2(x * vector.x, y * vector.y);
	}

	/// @param {Real} x
	/// @param {Real} y
	/// @return {Id.Instance<Struct.Vector2>}
	static sdivis = function(x, y) {
		return new Vector2(self.x / x, self.y / y);
	}
	
	/// @param {Struct.Vector2} vector
	/// @return {Id.Instance<Struct.Vector2>}
	static divis = function(vector) {
		return new Vector2(x / vector.x, y / vector.y);
	}

	/// @param {Struct.Vector2} vector
	/// @return {Real}
	static distance_to = function(vector) {
		return self.Magnitude - vector.Magnitude;
	}
	
	/// @param {Struct.Vector2} vector
	/// @return {Real}
	static dot = function(vector) {
		return x * vector.x + y * vector.y;
	}
	
	/// @param {Struct.Vector2} vector
	/// @return {Real}
	static cross = function(vector) {
		return x * vector.x - y * vector.y;
	}
	
	/// @param {Bool} radians
	/// @return {Real}
	static get_angle = function(radians = false) {
		return radians ? arctan2(y, x) : darctan2(y, x);
	}
	
	/// @return {Id.Instance<Struct.Vector2>}
	static get_sign = function() {
		return new Vector2(sign(x), sign(y));
	}
	
	/// @return {Struct.Vector2}
	static get_abs = function() {
		return new Vector2(abs(x), abs(y));
	}
	
	/// @param {Real} n
	/// @return {Struct.Vector2}
	static get_spower = function(n) {
		return new Vector2(power(x, n), power(y, n));
	}
	
	/// @param {Struct.Vector2} n
	/// @return {Struct.Vector2}
	static get_power = function(n) {
		return new Vector2(power(x, n.x), power(y, n.y));
	}
		
	/// @return {Struct.Vector2}
	static get_round = function() {
		return new Vector2(round(x), round(y));
	}
	
	/// @return {Struct.Vector2}
	static get_floor = function() {
		return new Vector2(floor(x), floor(y));
	}
	
	/// @return {Struct.Vector2}
	static get_ceil = function() {
		return new Vector2(ceil(x), ceil(y));
	}
	
	/// @param {Real} min
	/// @return {Struct.Vector2}
	static get_smin = function(_min) {
		return new Vector2(min(x, _min), min(y, _min));
	}
	
	/// @param {Struct.Vector2} min
	/// @return {Struct.Vector2}
	static get_min = function(_min) {
		return new Vector2(min(x, _min.x), min(y, _min.y));
	}
	
	/// @param {Real} max
	/// @return {Struct.Vector2}
	static get_smax = function(_max) {
		return new Vector2(max(x, _max), max(y, _max));
	}

	/// @param {Struct.Vector2} max
	/// @return {Struct.Vector2}
	static get_max = function(_max) {
		return new Vector2(max(x, _max.x), max(y, _max.y));
	}
	
	/// @param {Real} min
	/// @param {Real} max
	/// @return {Struct.Vector2}
	static get_sclamp = function(_min, _max) {
		return new Vector2(clamp(x, _min, _max),  clamp(y, _min, _max));
	}
	
	/// @param {Struct.Vector2} min
	/// @param {Struct.Vector2} max
	/// @return {Struct.Vector2}
	static get_clamp = function(_min, _max) {
		return new Vector2(clamp(x, _min.x, _max.x),  clamp(y, _min.y, _max.y));
	}
	
	/// @param {Struct.Vector2} target
	/// @param {Real} amount
	/// @return {Struct.Vector2}
	static get_slerp = function(target, amount) {
		var lerp_x = lerp(x, target.x, amount);
		var lerp_y = lerp(y, target.y, amount);
		return new Vector2(lerp_x, lerp_y);
	}
	
	/// @param {Struct.Vector2} target
	/// @param {Struct.Vector2} amount
	/// @return {Struct.Vector2}
	static get_lerp = function(target, amount) {
		var lerp_x = lerp(x, target.x, amount.x);
		var lerp_y = lerp(y, target.y, amount.y);
		return new Vector2(lerp_x, lerp_y);
	}
	
	/// @return {Struct.Vector2}
	static get_mirror = function() {
		return new Vector2(y, x);
	}

	/// @retunr {Struct.Vector2}
	static copy = function() {
		return new Vector2(x, y);
	}
	
	/// @return {Id.DsMap<Real>}
	static to_ds_map = function() {
		var map = ds_map_create();
		map[? "x"] = x; 
		map[? "y"] = y;
		return map;
	}
	
	/// @return {Id.DsList<Real>}
	static to_ds_list = function() {
		var list = ds_list_create();
		list[| 0] = x; 
		list[| 1] = y;
		return list;
	}
	
	/// @return {Array<Real>}
	static to_array = function() {
		return [x, y];
	}
	
	/// @param {String} delimiter
	/// @return {String}
	static to_string = function(delimiter = ":") {
		return $"{x}{delimiter}{y}";
	}
	
	/// @param {Real} dir
	/// @param {Real} value
	/// @param {Struct.Vector2} vector
	/// @return {Struct.Vector2}
	static __dir_base = function(dir, value, vector) {
		switch (dir) {
			case vector2_dir.down:
				vector.y = -value;
				break;

			case vector2_dir.left:
				vector.y = -value;
				break;

			case vector2_dir.one:
				vector.x = value;
				vector.y = value;
				break;

			case vector2_dir.right:
				vector.x = value;
				break;

			case vector2_dir.up:
				vector.y = value;
				break;

			case vector2_dir.negone:
				vector.x = -value;
				vector.y = -value;
				break;
		}
		
		return vector;
	}
	
	/// @param {Real} dir
	/// @param {Real} value
	/// @return {Struct.Vector2}
	static dir_set = function(dir, value) {
		return __dir_base(dir, value, copy());
	}
	
	/// @param {Real} dir
	/// @param {Real} value
	/// @return {Struct.Vector2}
	static dir_add = function(dir, value) {
		return add(__dir_base(dir, value, copy()));
	}
	
	/// @param {Real} dir
	/// @param {Real} value
	/// @return {Struct.Vector2}
	static dir_multi = function(dir, value) {
		return multi(__dir_base(dir, value, copy()));
	}
	
	/// @param {Real} dir
	/// @param {Real} value
	/// @return {Struct.Vector2}
	static dir_divis = function(dir, value) {
		return divis(__dir_base(dir, value, copy()));
	}
	
	/// @return {Struct.Vector2}
	static toString = function() {
		return to_string();
	}
}

/// @param {Any} struct
/// @return {Bool}
function is_vector2(struct) {
	return is_struct(struct) ? instanceof(struct) == "Vector2" : false;
}
