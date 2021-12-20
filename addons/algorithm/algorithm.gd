extends Node

const Iterator := preload("detail/iterator.gd")


# note: Type definitions.
# -----------------------

# unary_prdicate
# A function that takes a single element of a container and returns a value testable as bool.
# Additionally, it takes an Array argument that can be 
# used to supply it with data required for the evaluation.
# 
# Example:
# func is_valid_file(filepath: String, args: Array) -> bool:
#     var valid_extension := args[0] as String
#     return filepaht.endswith(valid_extension)

# unary_function
# A function that gets applied to a single element of a container.
# Additionally, it takes an Array argument that can be
# used to supply it with data required for the function.
#
# Example:
# func print_username(user: User, _args: Array) -> void:
#     print(user.username)





# note: Non-modifying sequence operations.
# ----------------------------------------

func all_of(container, unary_predicate: FuncRef, args: Array = []) -> bool:
	"""Checks if unary_predicate returns true for all elements in container."""
	for element in Iterator.input(container):
		if not unary_predicate.call_func(element, args):
			return false
	return true


func any_of(container, unary_predicate: FuncRef, args: Array = []) -> bool:
	"""Checks if unary_predicate returns true for at least one elements in container."""
	for element in Iterator.input(container):
		if unary_predicate.call_func(element, args):
			return true
	return false


func none_of(container, unary_predicate: FuncRef, args: Array = []) -> bool:
	"""Checks if unary_predicate returns true for no elements in container."""
	for element in Iterator.input(container):
		if unary_predicate.call_func(element, args):
			return false
	return true


func for_each(container, unary_function: FuncRef, args: Array = []) -> void:
	"""Applies the given function to every element in container."""
	for element in Iterator.input(container):
		unary_function.call_func(element, args)


func count(container, value) -> int:
	"""Returns the number of elements in container that are equal to value."""
	var result := 0
	for element in Iterator.input(container):
		if element == value:
			result += 1
	return result


func count_if(container, unary_predicate: FuncRef, args: Array = []) -> int:
	"""Returns the number of elements in container for which unary_predicate returns true."""
	var result := 0
	for element in Iterator.input(container):
		if unary_predicate.call_func(element, args):
			result += 1
	return result


func find(container, value):
	"""Returns the first element in container equal to value or null if no equal is found."""
	for element in Iterator.input(container):
		if element == value:
			return element
	return null


func find_if(container, unary_predicate: FuncRef, args: Array = []):
	"""Returns the first element in container for which unary_predicate retruns true
	or null if no element satisfies the criteria."""
	for element in Iterator.input(container):
		if unary_predicate.call_func(element, args):
			return element
	return null


func find_if_not(container, unary_predicate: FuncRef, args: Array = []):
	"""Returns the first element in container for which unary_predicate returns false
	or null if all elements satisfy the criteria."""
	for element in Iterator.input(container):
		if not unary_predicate.call_func(element, args):
			return element
	return null
