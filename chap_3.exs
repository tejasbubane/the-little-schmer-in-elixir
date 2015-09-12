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

  def insert_r(_new, _old, []), do: []
  def insert_r(new, old, [hd|tl]) when old == hd do
    [old|[new|tl]]
  end
  def insert_r(new, old, [hd|tl]) do
    [hd|insert_r(new, old, tl)]
  end

  def insert_l(_new, _old, []), do: []
  def insert_l(new, old, [hd|tl]) when old == hd do
    [new|[old|tl]]
  end
  def insert_l(new, old, [hd|tl]) do
    [hd|insert_l(new, old, tl)]
  end
end
