defmodule ExUnitAssertMatch.Types.Map do
  defstruct [:expected]

  def assert_self(%__MODULE__{}, data, opts) do
    {assertion_module, _opts} = Keyword.pop(opts, :assertion_module, ExUnit.Assertions)

    data |> is_map() |> assertion_module.assert("Expected #{inspect(data)} is map")
  end

  def assert_children(%__MODULE__{expected: nil}, _data, _opts) do
  end
  def assert_children(%__MODULE__{expected: expected}, data, opts) do
    Enum.each(expected, fn {key, val} ->
      ExUnitAssertMatch.assert(val, Map.get(data, key), opts)
    end)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Map do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Map.assert_self(type, data, opts)
    ExUnitAssertMatch.Types.Map.assert_children(type, data, opts)
  end
end
