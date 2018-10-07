defmodule ExUnitAssertMatch.Types.Integer do
  defstruct []

  def assert_self(%__MODULE__{}, data, opts) do
    data |> is_integer() |> opts.assertion_module.assert("Expected #{inspect(data)} is integer")
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Integer do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Integer.assert_self(type, data, opts)
  end
end
