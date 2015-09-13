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
  def tup_plus(lst_1, lst_2) when lst_1 == [] do
    lst_2
  end
  def tup_plus(lst_1, lst_2) when lst_2 == [] do
    lst_1
  end
  def tup_plus([hd_1|tl_1], [hd_2|tl_2]) do
    [add(hd_1, hd_2)|tup_plus(tl_1, tl_2)]
  end

  def greater_than?(0, _m), do: false
  def greater_than?(_n, 0), do: true
  def greater_than?(n, m) do
    greater_than?(sub_1(n), sub_1(m))
  end

  def less_than?(_n, 0), do: false
  def less_than?(0, _m), do: true
  def less_than?(n, m) do
    less_than?(sub_1(n), sub_1(m))
  end

  def eq?(0, 0), do: true
  def eq?(n, m) when n == 0 or m == 0 do
    false
  end
  def eq?(n, m) do
    eq?(sub_1(n), sub_1(m))
  end

  def pow(_base, 0), do: 1
  def pow(base, exponent) do
    mult(base, pow(base, sub_1(exponent)))
  end

  def divide(dividend, divisor) when dividend < divisor do
    0
  end
  def divide(dividend, divisor) do
    add_1(div(sub(dividend, divisor), divisor))
  end

  def len([]), do: 0
  def len([_hd|tl]) do
    add_1(len(tl))
  end

  def pick(0, _lst), do: raise IndexError
  def pick(index, [hd|_tl]) when index == 1 do
    hd
  end
  def pick(index, [_hd|tl]) do
    pick(sub_1(index), tl)
  end
end

defmodule NegativeNumberError do
  defexception message: "There are no negative numbers in this system"
end

defmodule IndexError do
  defexception message: "Index starts from 1"
end
