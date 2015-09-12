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

  def subst(_new, _old, []), do: []
  def subst(new, old, [hd|tl]) when old == hd do
    [new|tl]
  end
  def subst(new, old, [hd|tl]) do
    [hd|subst(new, old, tl)]
  end

  def subst_2(_new, _old_1, _old_2, []), do: []
  def subst_2(new, old_1, old_2, [hd|tl]) when hd == old_1 or hd == old_2 do
    [new|tl]
  end
  def subst_2(new, old_1, old_2, [hd|tl]) do
    [hd|subst_2(new, old_1, old_2, tl)]
  end

  def multi_rember(_atom, []), do: []
  def multi_rember(atom, [hd|tl]) when hd == atom do
    multi_rember(atom, tl)
  end
  def multi_rember(atom, [hd|tl]) do
    [hd|multi_rember(atom, tl)]
  end

  def multi_insert_r(_new, _old, []), do: []
  def multi_insert_r(new, old, [hd|tl]) when hd == old do
    [old|[new|multi_insert_r(new, old, tl)]]
  end
  def multi_insert_r(new, old, [hd|tl]) do
    [hd|multi_insert_r(new, old, tl)]
  end

  def multi_insert_l(_new, _old, []), do: []
  def multi_insert_l(new, old, [hd|tl]) when hd == old do
    [new|[old|multi_insert_l(new, old, tl)]]
  end
  def multi_insert_l(new, old, [hd|tl]) do
    [hd|multi_insert_l(new, old, tl)]
  end
end
