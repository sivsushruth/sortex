defmodule SortexTest.Sorter do
  use Sortex

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
end