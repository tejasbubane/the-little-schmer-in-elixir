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

  defmodule InsertRTest do
    use ExUnit.Case, async: true

    test "inserts the new element to the right of the old one" do
      assert insert_r(2, 1, [1]) == [1, 2]

      assert insert_r(:e, :d, [:a, :b, :c, :d, :f, :g, :h]) ==
        [:a, :b, :c, :d, :e, :f, :g, :h]

      assert insert_r(:topping, :fudge,
                      [:icecream, :with, :fudge, :for, :dessert]) ==
        [:icecream, :with, :fudge, :topping, :for, :dessert]
    end

    test "list returned as is if the old element does not exist" do
      assert insert_r(:d, :x, [:a, :b, :c]) == [:a, :b, :c]
    end
  end

  defmodule InsertLTest do
    use ExUnit.Case, async: true

    test "inserts new element to the left of the old one" do
      assert insert_l(2, 1, [1]) == [2, 1]

      assert insert_l(:e, :d, [:a, :b, :c, :d, :f, :g, :h]) ==
        [:a, :b, :c, :e, :d, :f, :g, :h]

      assert insert_l(:topping, :fudge,
                      [:icecream, :with, :fudge, :for, :dessert]) ==
        [:icecream, :with, :topping, :fudge, :for, :dessert]
    end

    test "list returned as is if the old element does not exist" do
      assert insert_r(:d, :x, [:a, :b, :c]) == [:a, :b, :c]
    end
  end

  defmodule SubstTest do
    use ExUnit.Case, async: true

    test "substitutes the old element with the new one" do
      assert subst(2, 1, [1]) == [2]

      assert subst(:and, :with, [:icecream, :with, :fudge, :for, :dessert]) ==
        [:icecream, :and, :fudge, :for, :dessert]
    end
  end

  defmodule Subst2Test do
    use ExUnit.Case, async: true

    test "substitutes the new element with either of the two old ones" do
      assert subst_2(2, 3, 1, [1]) == [2]

      assert subst_2(:and, :with, :for,
                   [:icecream, :with, :fudge, :for, :dessert]) ==
        [:icecream, :and, :fudge, :for, :dessert]
    end
  end

  defmodule MultiRemberTest do
    use ExUnit.Case, async: true

    test "remove all occurrences of given element" do
      assert multi_rember(1, [1]) == []

      assert multi_rember(1, [2, 1, 1, 2]) == [2, 2]

      assert multi_rember(:cup, [:coffee, :cup, :tea, :cup,
                                 :and, :hick, :cup]) ==
        [:coffee, :tea, :and, :hick]
    end
  end
end
