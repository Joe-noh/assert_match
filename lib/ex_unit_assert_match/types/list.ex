defmodule ExUnitAssertMatch.Types.List do
  @moduledoc false

  defstruct [:example]

  def assert_self(%__MODULE__{}, data, opts, state) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is list", state)

    data
    |> is_list()
    |> opts.assertion_module.assert(message)
  end

  def assert_children(%__MODULE__{example: nil}, _data, _opts, _state) do
  end

  def assert_children(%__MODULE__{example: example}, data, opts, state) do
    data
    |> Enum.with_index()
    |> Enum.each(fn {elem, index} ->
      state = %ExUnitAssertMatch.InternalState{state | key_stack: [index | state.key_stack]}
      ExUnitAssertMatch.assert(example, elem, opts, state)
    end)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.List do
  def assert(type, data, opts, state) do
    ExUnitAssertMatch.Types.List.assert_self(type, data, opts, state)
    ExUnitAssertMatch.Types.List.assert_children(type, data, opts, state)
  end
end
