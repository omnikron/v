const c_a_s = 1
const c_b_s = 1 + 1
const c_c_s = c_b_s + 1

fn test_consant_array_size() {
	mut a := [c_a_s]int{}
	a = [1]!
	mut b := [c_b_s]int{}
	b = [1, 2]!
}

// test const was declared below struct fixed array fields declaration
struct Foo {
	posts [max_posts_count]int
}

const max_posts_count = 5

fn test_const_below_at_struct_fixed_array_fields() {
	foo := Foo{}
	assert foo.posts == [0, 0, 0, 0, 0]!
}

// for issue 20311
// When using a static variable to define a fixed array size,
// if the static variable is defined below or in another module, the size value will not be calculated correctly.
fn test_const_below_at_fixed_array() {
	arr := [width][2][width + 1]f64{}
	assert arr.len == 2
	assert arr[0].len == 2
	assert arr[0][0].len == 3
	assert arr == [[[0.0, 0.0, 0.0]!, [0.0, 0.0, 0.0]!]!, [[0.0, 0.0, 0.0]!,
		[0.0, 0.0, 0.0]!]!]!
}

// Do not move this definition; it must be below `fn test_const_below_at_fixed_array()`.
const width = 2
