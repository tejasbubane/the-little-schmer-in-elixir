Code.load_file("chap_1.exs")

ExUnit.start

defmodule Chap1Test do
  import Chap1

  defmodule LatTest do
    use ExUnit.Case, async: true

    test "Empty list is a lat because it does not contain a list of atoms" do
      assert lat?([])
    end

    test "list with one element as atom" do
      assert lat?([1])
    end

    test "list with one element as another list" do
      refute lat?([[1]])
    end

    test "list of multiple atoms" do
      assert lat?([:this, "is", :a, "list", :of, 7, :atoms])
    end

    test "list of lists" do
      refute lat?([:some, [:inner], "list"])
    end

    test "with more nested lists" do
      refute lat?([[1, 3], [:this, [:is, [:deep]]]])
    end
  end
end
