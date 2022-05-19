defmodule Recurse do
  def my_map(enum, fun) do
    enum
    |> do_my_map(fun, [])
    |> Enum.reverse()
  end

  defp do_my_map([h | t], fun, acc) do
    acc = [fun.(h) | acc]
    do_my_map(t, fun, acc)
  end

  defp do_my_map([], _fun, acc), do: acc
end
