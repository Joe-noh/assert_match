defmodule ExUnitAssertMatch.Types.Atom do
  defstruct []

  def assert_self(%__MODULE__{}, data, opts) do
    {assertion_module, _opts} = Keyword.pop(opts, :assertion_module, ExUnit.Assertions)

    data |> is_atom() |> assertion_module.assert("Expected #{inspect(data)} is atom")
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Atom do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Atom.assert_self(type, data, opts)
  end
end
