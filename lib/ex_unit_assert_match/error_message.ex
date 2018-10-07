defmodule ExUnitAssertMatch.ErrorMessage do
  def build(base, opts) do
    base
    |> append_key_stack(opts.key_stack)
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
