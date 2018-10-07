defmodule ExUnitAssertMatch.Types.Map do
  defstruct [:example]

  def assert_self(%__MODULE__{}, data, opts) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is map", opts)

    data
    |> is_map()
    |> opts.assertion_module.assert(message)
  end

  def assert_children(%__MODULE__{example: nil}, _data, _opts) do
  end
  def assert_children(%__MODULE__{example: example}, data, opts) do
    Enum.each(example, fn {key, val} ->
      opts = %ExUnitAssertMatch.Option{opts | key_stack: [key | opts.key_stack]}
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
