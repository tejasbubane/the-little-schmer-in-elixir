Code.load_file("chap_2.exs")

ExUnit.start

defmodule Chap2Test do
  import Chap2

  defmodule MemberTest do
    use ExUnit.Case, async: true

    test "empty list does not have any member" do
      refute member?(:this, [])
    end

    test "with one element list containing the atom" do
      assert member?(:this, [:this])
    end

    test "when element does not exist in the list" do
      refute member?(:this, [:that, "and", "something else"])
    end
  end
end
