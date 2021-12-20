extends Object

const Pair := preload("../pair.gd")


class InputIntf:
	extends Reference
	
	func _iter_init(_arg) -> bool:
		# note: Initialize iteration.
		return _iter_should_continue()
	
	func _iter_should_continue() -> bool:
		return false
	
	func _iter_next(_arg) -> bool:
		# note: Step iteration.
		return _iter_should_continue()
	
	func _iter_get(_arg):
		return null


class InputArray:
	extends InputIntf
	
	var _array: Array
	var _current_index: int
	
	func _init(array: Array) -> void:
		_array = array
	
	func _iter_init(_arg) -> bool:
		_current_index = 0
		return _iter_should_continue()
	
	func _iter_should_continue() -> bool:
		return _current_index < _array.size()
	
	func _iter_next(_arg) -> bool:
		_current_index += 1
		return _iter_should_continue()
	
	func _iter_get(_arg):
		return _array[_current_index]


class InputDictionary:
	extends InputArray
	
	func _init(dictionary: Dictionary).(_dictionary_to_array(dictionary)) -> void:
		pass
	
	func _dictionary_to_array(dictionary: Dictionary) -> Array:
		var result := []
		for key in dictionary:
			result.push_back(Pair.new(key, dictionary[key]))
		return result


static func input(container) -> InputIntf:
	match typeof(container):
		TYPE_ARRAY:
			return InputArray.new(container)
		TYPE_DICTIONARY:
			return InputDictionary.new(container)
	return InputIntf.new()
