defmodule ExUnitAssertMatch.Types.Integer do
  defstruct []

  def assert_self(%__MODULE__{}, data, opts) do
    {assertion_module, _opts} = Keyword.pop(opts, :assertion_module, ExUnit.Assertions)

    data |> is_integer() |> assertion_module.assert("Expected #{inspect(data)} is integer")
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Integer do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Integer.assert_self(type, data, opts)
  end
end
