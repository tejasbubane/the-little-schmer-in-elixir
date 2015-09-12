Code.load_file("chap_3.exs")

ExUnit.start

defmodule Chap3Test do
  import Chap3

  defmodule RemberTest do
    use ExUnit.Case, async: true

    test "removes a member" do
      assert rember(:mint, [:lamb, :chops, :and, :mint, :jelly]) ==
        [:lamb, :chops, :and, :jelly]
    end

    test "removes only the first occurrence" do
      assert rember(:mint, [:lamb, :chops, :mint, :and, :mint, :jelly]) ==
        [:lamb, :chops, :and, :mint, :jelly]
    end

    test "returns list as it is in case of no occurrence" do
      assert rember(:toast, [:lamb, :chops, :and, :mint, :jelly]) ==
        [:lamb, :chops, :and, :mint, :jelly]
    end

    test "list with one atom" do
      assert rember(:this, [:this]) == []
      assert rember(:this, [:that]) == [:that]
    end
  end
end
