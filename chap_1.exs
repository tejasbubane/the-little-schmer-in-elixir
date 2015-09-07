defmodule Chap1 do
  def lat?([]), do: true
  def lat?(list) when is_list(hd(list)) do
    false
  end
  def lat?(list), do: lat?(tl(list))
end
