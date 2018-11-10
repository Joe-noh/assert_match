defmodule ExUnitAssertMatch.ErrorMessage do
  @moduledoc false

  def build(base, state) do
    base
    |> append_key_stack(state.key_stack)
  end

  defp append_key_stack(message, []) do
    message
  end

  defp append_key_stack(message, stack) do
    path =
      stack
      |> Enum.reverse()
      |> Enum.map(&inspect/1)
      |> Enum.join(" > ")

    ~s"""
    #{message}

    Path: #{path}
    """
  end
end
