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
      assert_raise(FunctionClauseError, fn -> sub_1(0) end)
    end
  end

  defmodule ZeroTest do
    use ExUnit.Case, async: true

    test "checks if the argument is a zero" do
      assert zero?(0)
      refute zero?(1492)
    end
  end
end
