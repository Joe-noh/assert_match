defmodule ExUnitAssertMatch.Types.Literal do
  defstruct [:example]

  def assert_self(%__MODULE__{example: literal}, data, opts) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{data} is #{literal}", opts)

    opts.assertion_module.assert(literal == data, message)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Literal do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Literal.assert_self(type, data, opts)
  end
end
