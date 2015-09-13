Code.load_file("chap_4.exs")

ExUnit.start

defmodule Chap4Test do
  import Chap4
  use ExUnit.Case, async: true

  test "#add_1 adds 1 to the argument" do
    assert add_1(2) == 3
    assert add_1(21) == 22
  end

  test "#sub_1 subtracts 1 from the argument" do
    assert sub_1(2) == 1
    assert sub_1(21) == 20
  end

  test "#sub_1 raises exception for negative numbers" do
    assert_raise(NegativeNumberError,
                 fn -> sub_1(0) end)
  end

  test "#zero? checks if the argument is a zero" do
    assert zero?(0)
    refute zero?(1492)
  end

  test "#add adds two numbers" do
    assert add(1, 2) == 3
    assert add(12, 13) == 25
  end

  test "#sub subtracts two numbers" do
    assert sub(14, 3) == 11
    assert sub(17, 9) == 8
  end

  test "#sub raises error for negative numbers" do
    assert_raise(NegativeNumberError,
                 fn -> sub(18, 25) end)
  end

  test "#tup? checks if the list is a tuple" do
    assert tup?([])
    assert tup?([1, 2, 3, 4, 5])

    refute tup?([:this, :is, :not, :a, :tuple])
    refute tup?([1, [2, 3], 4, 5])
  end

  test "#add_tup adds all elements in the tuple" do
    assert add_tup([]) == 0
    assert add_tup([1]) == 1
    assert add_tup([1, 2, 3, 4, 5]) == 15
    assert add_tup([12, 24, 1, 4]) == 41
  end

  test "#mult multiplies two numbers" do
    assert mult(5, 4) == 20
    assert mult(13, 4) == 52

    assert mult(4, 0) == 0
    assert mult(0, 19) == 0
  end

  test "#tup_plus Adds the two tups" do
    assert tup_plus([], []) == []
    assert tup_plus([1], [2]) == [3]
    assert tup_plus([4, 5], [6, 7]) == [10, 12]
    assert tup_plus([3, 6, 9, 11, 4], [8, 5, 2, 0, 7]) == [11, 11, 11, 11, 11]
  end

  test "#tup_plus works for tups of any length" do
    assert tup_plus([1, 2], [3]) == [4, 2]
    assert tup_plus([4, 9, 1, 5], [0, 6]) == [4, 15, 1, 5]
  end

  test "#greater_than checks if the first number is greater than second" do
    assert greater_than?(1, 0)
    assert greater_than?(3, 2)
    assert greater_than?(12435786, 124556)

    refute greater_than?(0, 0)
    refute greater_than?(4, 4)
    refute greater_than?(0, 1)
    refute greater_than?(13, 1212)
  end

  test "#less_than? checks if the first number is lesser than second" do
    assert less_than?(0, 1)
    assert less_than?(2, 3)
    assert less_than?(124556, 12435786)

    refute less_than?(0, 0)
    refute less_than?(4, 4)
    refute less_than?(1, 0)
    refute less_than?(1212, 13)
  end

  test "#eq? Compares the two numbers to check both are equal" do
    assert eq?(0, 0)
    assert eq?(2, 2)
    assert eq?(126, 126)

    refute eq?(1, 0)
    refute eq?(5, 4)
    refute eq?(156, 125)
  end

  test "#pow raises a number to the power" do
    assert pow(1, 0) == 1
    assert pow(1, 1) == 1
    assert pow(2, 2) == 4
    assert pow(25, 3) == 15625
  end

  test "#div divides the number" do
    assert divide(5, 3) == 1
    assert divide(1, 1) == 1
    assert divide(25, 5) == 5
    assert divide(45, 54) == 0
  end

  test "#len returns the length of a list" do
    assert len([]) == 0
    assert len([4]) == 1
    assert len([5, 6, 2, 1]) == 4
  end

  test "#pick returns element at particular position in a list" do
    assert pick(1, [:a]) == :a
    assert pick(5, [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) == 5
  end

  test "#pick raises IndexError for position zero" do
    assert_raise IndexError, fn -> pick(0, [1, 2, 3, 4]) end
  end

  test "#rempick returns the list with element at the given position removed" do
    assert rempick(1, [:a]) == []
    assert rempick(2, [:a, :b, :c]) == [:a, :c]
    assert rempick(3, [:hotdogs, :with, :hot, :mustard]) ==
      [:hotdogs, :with, :mustard]
  end

  test "#no_nums removes all numbers from a given list" do
    assert no_nums([]) == []
    assert no_nums([1]) == []
    assert no_nums([1, :some, 2, :none]) == [:some, :none]
    assert no_nums([5, :pears, 6, :prunes, 9, :dates]) ==
      [:pears, :prunes, :dates]
  end

  test "#all_nums extracts tup from a lat with all numbers" do
    assert all_nums([]) == []
    assert all_nums([1]) == [1]
    assert all_nums([1, :some, 2, :none]) == [1, 2]
    assert all_nums([5, :pears, 6, :prunes, 9, :dates]) == [5, 6, 9]
  end
end
