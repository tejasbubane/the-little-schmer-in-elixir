defmodule Chap4 do
  def add_1(number), do: number + 1

  def sub_1(number) when number > 0 do
    number - 1
  end
  def sub_1(_number) do
    raise NegativeNumberError
  end

  def zero?(number) when number == 0 do
    true
  end
  def zero?(_number), do: false

  def add(n, 0), do: n
  def add(n, m) do
    add(add_1(n), sub_1(m))
  end

  def sub(n, 0), do: n
  def sub(n, m) do
    sub(sub_1(n), sub_1(m))
  end

  # A tuple here is a list of numbers only
  # and has nothing to do with elixr tuples.
  def tup?([]), do: true
  def tup?([hd|tl]) when is_number(hd) do
    tup?(tl)
  end
  def tup?(_list), do: false

  def add_tup([]), do: 0
  def add_tup([hd|tl]) do
    add(hd, add_tup(tl))
  end

  # avoid recursion if either number is zero
  def mult(n, m) when n == 0 or m == 0 do
    0
  end
  def mult(n, m) when m == 1 do
    n
  end
  def mult(n, m) do
    add(n, mult(n, sub_1(m)))
  end

  def tup_plus([], []), do: []
  def tup_plus(lst_1, lst_2) when lst_1 == [] or lst_2 == [] do
    raise ListsLengthMismatchError
  end
  def tup_plus([hd_1|tl_1], [hd_2|tl_2]) do
    [add(hd_1, hd_2)|tup_plus(tl_1, tl_2)]
  end
end

defmodule NegativeNumberError do
  defexception message: "There are no negative numbers in this system"
end

defmodule ListsLengthMismatchError do
  defexception message: "Lists should be of equal length"
end
