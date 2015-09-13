defmodule Chap4 do
  def add_1(number), do: number + 1

  def sub_1(number) when number > 0 do
    number - 1
  end
  def sub_1(number) do
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
end

defmodule NegativeNumberError do
  defexception message: "There are no negative numbers in this system"
end
