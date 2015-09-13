Code.load_file("chap_4.exs")

ExUnit.start

defmodule Chap4Test do
  import Chap4

  defmodule Add1Test do
    use ExUnit.Case, async: true

    test "adds 1 to the argument" do
      assert add_1(2) == 3
      assert add_1(21) == 22
    end
  end

  defmodule Sub1Test do
    use ExUnit.Case, async: true

    test "subtracts 1 from the argument" do
      assert sub_1(2) == 1
      assert sub_1(21) == 20
    end

    test "raises exception" do
      assert_raise(NegativeNumberError,
                   "There are no negative numbers in this system",
                   fn -> sub_1(0) end)
    end
  end

  defmodule ZeroTest do
    use ExUnit.Case, async: true

    test "checks if the argument is a zero" do
      assert zero?(0)
      refute zero?(1492)
    end
  end

  defmodule AddTest do
    use ExUnit.Case, async: true

    test "adds two numbers" do
      assert add(1, 2) == 3
      assert add(12, 13) == 25
    end
  end

  defmodule SubTest do
    use ExUnit.Case, async: true

    test "adds two numbers" do
      assert sub(14, 3) == 11
      assert sub(17, 9) == 8

      assert_raise(NegativeNumberError,
                   "There are no negative numbers in this system",
                   fn -> sub(18, 25) end)
    end
  end

  defmodule TupleTest do
    use ExUnit.Case, async: true

    test "checks if the list is a tuple" do
      assert tup?([])
      assert tup?([1, 2, 3, 4, 5])

      refute tup?([:this, :is, :not, :a, :tuple])
      refute tup?([1, [2, 3], 4, 5])
    end
  end

  defmodule AddTupleTest do
    use ExUnit.Case, async: true

    test "adds all elements in the tuple" do
      assert add_tup([]) == 0
      assert add_tup([1]) == 1
      assert add_tup([1, 2, 3, 4, 5]) == 15
      assert add_tup([12, 24, 1, 4]) == 41
    end
  end

  defmodule MultTest do
    use ExUnit.Case, async: true

    test "multiplies two numbers" do
      assert mult(5, 4) == 20
      assert mult(13, 4) == 52

      assert mult(4, 0) == 0
      assert mult(0, 19) == 0
    end
  end

  defmodule TupPlusTest do
    use ExUnit.Case, async: true

    test "Adds the two tups" do
      assert tup_plus([], []) == []
      assert tup_plus([1], [2]) == [3]
      assert tup_plus([4, 5], [6, 7]) == [10, 12]
      assert tup_plus([3, 6, 9, 11, 4], [8, 5, 2, 0, 7]) == [11, 11, 11, 11, 11]
    end

    test "raises exception for lists of unequal length" do
      assert_raise(ListsLengthMismatchError,
                   "Lists should be of equal length",
                   fn -> tup_plus([1, 2], [3]) end)
    end
  end
end
