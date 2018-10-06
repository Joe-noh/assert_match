defmodule ExUnitAssertMatch.Types.Integer do
  defstruct []
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Integer do
  require ExUnit.Assertions

  def assert(_type, data) do
    ExUnit.Assertions.assert(is_integer(data), "Expected #{inspect(data)} is integer")
  end
end
