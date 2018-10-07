defmodule ExUnitAssertMatch.Types.Literal do
  defstruct [:example]

  def assert_self(%__MODULE__{example: literal}, data, opts) do
    opts.assertion_module.assert literal == data, "Expected #{data} is #{literal}"
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Literal do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Literal.assert_self(type, data, opts)
  end
end
