defmodule ExUnitAssertMatch.Types.Integer do
  @moduledoc false

  defstruct []

  def assert_self(%__MODULE__{}, data, opts, state) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is integer", state)

    data
    |> is_integer()
    |> opts.assertion_module.assert(message)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Integer do
  def assert(type, data, opts, state) do
    ExUnitAssertMatch.Types.Integer.assert_self(type, data, opts, state)
  end
end
