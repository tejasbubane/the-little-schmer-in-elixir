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
end
