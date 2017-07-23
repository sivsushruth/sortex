# Sortex

Sort using multiple criteria and scores

```
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

```

## Installation

The package can be installed
by adding `sortex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:sortex, "~> 0.1.0"}]
end
```

The docs can
be found at [https://hexdocs.pm/sortex](https://hexdocs.pm/sortex).

