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

  defmodule FirstsTest do
    use ExUnit.Case, async: true

    test "get firsts of a list (of lists)" do
      assert firsts([[:a, :b], [:c, :d], [:e, :f]]) ==
        [:a, :c, :e]

      assert firsts([[:apple, :peach, :pumpkin],
                     [:plum, :pear, :cherry],
                     [:grape, :raisi, :peas],
                     [:bean, :carrot, :eggplant]]) ==
        [:apple, :plum, :grape, :bean]
    end

    test "with nested lists" do
      assert firsts([[[:five, :plums], :four],
                     [:eleven, :green, :oranges],
                     [[:no], :more]]) ==
        [[:five, :plums], :eleven, [:no]]
    end
  end
end
