defmodule ExUnitAssertMatch.Types.Atom do
  @moduledoc false

  defstruct []

  def assert_self(%__MODULE__{}, data, opts, state) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is atom", state)

    data
    |> is_atom()
    |> opts.assertion_module.assert(message)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Atom do
  def assert(type, data, opts, state) do
    ExUnitAssertMatch.Types.Atom.assert_self(type, data, opts, state)
  end
end
