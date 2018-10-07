defmodule ExUnitAssertMatch.Types.Binary do
  defstruct []

  def assert_self(%__MODULE__{}, data, opts) do
    data |> is_binary() |> opts.assertion_module.assert("Expected #{inspect(data)} is binary")
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Binary do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Binary.assert_self(type, data, opts)
  end
end
