defmodule ExUnitAssertMatch.Types.Float do
  defstruct []

  def assert_self(%__MODULE__{}, data, opts) do
    data |> is_float() |> opts.assertion_module.assert("Expected #{inspect(data)} is float")
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Float do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Float.assert_self(type, data, opts)
  end
end
