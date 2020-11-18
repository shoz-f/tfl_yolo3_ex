defmodule TflYolo3Test do
  use ExUnit.Case
  doctest TflYolo3

  test "object detection in 'dog.jpg'" do
    {:ok, res} = TflYolo3.TflInterp.predict("test/dog.jpg")
    assert Map.keys(res) == ["bicycle", "dog", "truck"]
    assert res["bicycle"] == [[163, 115, 566, 435]]
    assert res["dog"    ] == [[123, 223, 322, 543]]
    assert res["truck"  ] == [[472,  86, 692, 166]]
  end
  
  test "object detection in 'person.jpg'" do
    {:ok, res} = TflYolo3.TflInterp.predict("test/person.jpg")
    assert Map.keys(res) == ["dog", "horse", "person"]
    assert res["dog"   ] == [[ 61, 262, 204, 351]]
    assert res["horse" ] == [[396, 137, 612, 351]]
    assert res["person"] == [[189,  90, 277, 387]]
  end
end
