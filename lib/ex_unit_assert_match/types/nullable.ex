defmodule ExUnitAssertMatch.Types.Nullable do
  @moduledoc false

  defstruct [:example]

  def assert_self(%__MODULE__{}, nil, _opts) do
  end

  def assert_self(%__MODULE__{example: example}, data, opts) do
    ExUnitAssertMatch.assert(example, data, opts)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Nullable do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.Nullable.assert_self(type, data, opts)
  end
end
