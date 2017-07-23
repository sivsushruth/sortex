defmodule SortexTest do
  use ExUnit.Case
  doctest Sortex
  alias SortexTest.Sorter

  @input1 [%{a: 1, b: %{c: 1, d: 2}}, %{a: 2, b: %{c: 5, d: 3}}, %{a: 4, b: %{c: 6, d: 2}}, %{a: 2, b: %{c: 6, d: 4}}]

  test "a" do
    ans = @input1
    |> Sorter.a
    |> Sorter.sort
    expected_ans = [%{a: 1, b: %{c: 1, d: 2}}, %{a: 2, b: %{c: 5, d: 3}}, %{a: 2, b: %{c: 6, d: 4}}, %{a: 4, b: %{c: 6, d: 2}}]
    assert ans == expected_ans
  end

  test "b" do
    ans = @input1
    |> Sorter.b
    |> Sorter.sort
    expected_ans = [%{a: 1, b: %{c: 1, d: 2}}, %{a: 2, b: %{c: 5, d: 3}}, %{a: 4, b: %{c: 6, d: 2}}, %{a: 2, b: %{c: 6, d: 4}}]
    assert ans == expected_ans
  end
end
