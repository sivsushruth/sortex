defmodule Sortex.Rules do
  defmacro __using__(_opts) do
    quote do
      import Sortex.Rules
    end
  end

  defmacro defrule(name, do: block) do
    function_name = String.to_atom(name)
    quote do
      def unquote(function_name)(args), do: {args, unquote(block)}
    end
  end
end
