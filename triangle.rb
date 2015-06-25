# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # WRITE THIS CODE
  get_angles = []
  get_angles << a
  get_angles << b
  get_angles << c
  get_angles.sort!

  if(get_angles.min <= 0)
    raise TriangleError.new("Found illegal value: #{get_angles.min}")
  elsif get_angles[0] + get_angles[1] <= get_angles[2]
    raise TriangleError.new("Two of three triangle sides must be greater than third side")
  end


  #if 1 unique, all sides are equal
  if get_angles.uniq.length == 1
  	:equilateral
  
  #if 2 uniques, two out of three angles are similar, third is unique
  elsif get_angles.uniq.length == 2
  	:isosceles
  
  #if 3 uniques, no sides are equal
  elsif get_angles.uniq.length == 3
  	:scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
