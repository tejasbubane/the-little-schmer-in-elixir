defmodule Chap3 do
  def rember(_atom, []), do: []
  def rember(atom, [hd|tl]) when hd == atom do
    tl
  end
  def rember(atom, [hd|tl]) do
    [hd|rember(atom, tl)]
  end

  def firsts([]), do: []
  def firsts([hd|tl]) do
    [hd(hd)|firsts(tl)]
  end
end
