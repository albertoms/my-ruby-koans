require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    # NTS:
    # << it's just another way to add an element to an array
    array << 333
    assert_equal [1, 2, 333], array
  end

  # to-do: confirm that ":" is another way to declare an object
  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly, "nice"]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal "nice", array.last
    assert_equal "nice", array[-1]
    assert_equal :and, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]

    # to-do:
    # Do some research on arrays...
    # I understand that the way to slice an array is array[start_index, how_many_items]
    # but I don't get why array[4,0] = [] but array[5,0] = nil when the array length is 4.
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a
    assert_equal [1,2,3,4], (1...5).to_a

    # NTS:
    # It seems that Ruby assume that if you put a nnumber followed by two dots and other
    # number at the end you are creating a range.
    # If you put three dots instead of two, Ruby assume that you want to include all the
    # elements but the last in that range. 
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]

    # NTS:
    # Remember, -1 passed as an array index means the last element.
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1, 2, :last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1, 2], array

    # NTS:
    # array.pop will remove and return the last element of the array.
    # array.push will add an element to the last position of the array.
  end

  def test_shifting_arrays
    array = [1,2]

    array.unshift(:first)

    assert_equal [:first, 1, 2], array

    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1, 2], array

    # NTS:
    # array.shift will remove and return the first element of the array.
    # array.unshift(element) will add an element to the first positionn of the array.
    #
    # to-do:
    # Maybe it's because I'm not a native english speaker, but it doesn't feel natural
    # to me to use 'unshift' to add an element. 
  end

end
