defmodule ExUnitAssertMatch.Types.Float do
  @moduledoc false

  defstruct []

  def assert_self(%__MODULE__{}, data, opts, state) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is float", state)

    data
    |> is_float()
    |> opts.assertion_module.assert(message)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Float do
  def assert(type, data, opts, state) do
    ExUnitAssertMatch.Types.Float.assert_self(type, data, opts, state)
  end
end
