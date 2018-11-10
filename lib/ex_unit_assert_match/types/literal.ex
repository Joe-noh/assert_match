defmodule ExUnitAssertMatch.Types.Literal do
  @moduledoc false

  defstruct [:example]

  def assert_self(%__MODULE__{example: literal}, data, opts, state) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{data} is #{literal}", state)

    opts.assertion_module.assert(literal == data, message)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Literal do
  def assert(type, data, opts, state) do
    ExUnitAssertMatch.Types.Literal.assert_self(type, data, opts, state)
  end
end
