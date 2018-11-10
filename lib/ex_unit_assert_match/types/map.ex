defmodule ExUnitAssertMatch.Types.Map do
  @moduledoc false

  defstruct example: nil, exact_same_keys: false

  def assert_self(struct = %__MODULE__{example: example}, data, opts, state) do
    if struct.exact_same_keys do
      example_keys = example |> Map.keys() |> Enum.sort()
      data_keys = data |> Map.keys() |> Enum.sort()

      message = ~s"""
      #{ExUnitAssertMatch.ErrorMessage.build("Expected to have exact same keys", state)}

      expected: #{inspect example_keys}
      actual:   #{inspect data_keys}
      """

      opts.assertion_module.assert example_keys == data_keys, message
    end

    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is map", state)

    data
    |> is_map()
    |> opts.assertion_module.assert(message)
  end

  def assert_children(%__MODULE__{example: nil}, _data, _opts, _state) do
  end

  def assert_children(%__MODULE__{example: example}, data, opts, state) do
    Enum.each(example, fn {key, val} ->
      state = %ExUnitAssertMatch.InternalState{state | key_stack: [key | state.key_stack]}
      ExUnitAssertMatch.assert(val, Map.get(data, key), opts, state)
    end)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Map do
  def assert(type, data, opts, state) do
    ExUnitAssertMatch.Types.Map.assert_self(type, data, opts, state)
    ExUnitAssertMatch.Types.Map.assert_children(type, data, opts, state)
  end
end
