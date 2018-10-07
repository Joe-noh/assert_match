defmodule ExUnitAssertMatch.Types.Integer do
  defstruct []

  def assert_self(%__MODULE__{}, data, opts) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is integer", opts)

    data
    |> is_integer()
    |> opts.assertion_module.assert(message)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Integer do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Integer.assert_self(type, data, opts)
  end
end
