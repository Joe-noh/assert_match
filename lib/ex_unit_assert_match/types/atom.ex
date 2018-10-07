defmodule ExUnitAssertMatch.Types.Atom do
  defstruct []

  def assert_self(%__MODULE__{}, data, opts) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is atom", opts)

    data
    |> is_atom()
    |> opts.assertion_module.assert(message)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Atom do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Atom.assert_self(type, data, opts)
  end
end
