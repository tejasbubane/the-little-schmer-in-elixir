defmodule Chap4 do
  def add_1(number), do: number + 1

  def sub_1(number) when number > 0 do
    number - 1
  end

  def zero?(number) when number == 0 do
    true
  end
  def zero?(number), do: false
end
