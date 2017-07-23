defmodule Sortex do
  defmacro __using__(_opts) do
    quote do
      use Sortex.Rules
      import Sortex
    end
  end

  def sort({data, score_fn}) do
    data
    |> Enum.sort_by(fn d ->
      score_fn.(d)
      |> Enum.reduce(0, fn({rank, data}, acc1) ->
        ((1.00/rank) * (Enum.reduce(data, 0, fn v, acc2 -> v + acc2 end))) + acc1
      end)
    end)
  end
end
