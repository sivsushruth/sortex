defmodule SortexTest do
  use ExUnit.Case
  use Sortex
  doctest Sortex

  @input1 [%{a: 1, b: %{c: 1, d: 2}}, %{a: 2, b: %{c: 5, d: 3}}, %{a: 4, b: %{c: 6, d: 2}}, %{a: 2, b: %{c: 6, d: 4}}]

  defrule "a" do
    fn data ->
      %{
        1 => [
          data[:a]
        ],
        2 => [
          data[:b][:c] || 0
        ]
      }
    end
  end

  defrule "b" do
    fn data ->
      %{
        1 => [
          data[:b][:c] || 0
        ],
        2 => [
          data[:b][:d] || 0
        ]
      }
    end
  end

  test "a" do
    ans = @input1
    |> __MODULE__.a
    |> sort
    expected_ans = [%{a: 1, b: %{c: 1, d: 2}}, %{a: 2, b: %{c: 5, d: 3}}, %{a: 2, b: %{c: 6, d: 4}}, %{a: 4, b: %{c: 6, d: 2}}]
    assert ans == expected_ans
  end

  test "b" do
    ans = @input1
    |> __MODULE__.b
    |> sort
    expected_ans = [%{a: 1, b: %{c: 1, d: 2}}, %{a: 2, b: %{c: 5, d: 3}}, %{a: 4, b: %{c: 6, d: 2}}, %{a: 2, b: %{c: 6, d: 4}}]
    assert ans == expected_ans
  end
end
