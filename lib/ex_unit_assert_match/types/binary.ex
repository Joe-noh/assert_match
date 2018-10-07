defmodule ExUnitAssertMatch.Types.Binary do
  @moduledoc false

  defstruct []

  def assert_self(%__MODULE__{}, data, opts) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is binary", opts)

    data
    |> is_binary()
    |> opts.assertion_module.assert(message)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Binary do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Binary.assert_self(type, data, opts)
  end
end
