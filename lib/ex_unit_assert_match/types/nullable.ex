defmodule ExUnitAssertMatch.Types.Nullable do
  @moduledoc false

  defstruct [:example]

  def assert_self(%__MODULE__{}, nil, _opts, _state) do
  end

  def assert_self(%__MODULE__{example: example}, data, opts, state) do
    ExUnitAssertMatch.assert(example, data, opts, state)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Nullable do
  def assert(type, data, opts, state) do
    ExUnitAssertMatch.Types.Nullable.assert_self(type, data, opts, state)
  end
end
