defmodule Chap2 do
  def member?(_atom, []), do: false
  def member?(atom, list) when atom == hd(list) do
    true
  end
  def member?(atom, list), do: member?(atom, tl(list))
end
