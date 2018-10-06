defmodule ExUnitAssertMatch.Types.Float do
  defstruct []
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Float do
  require ExUnit.Assertions

  def assert(_type, data) do
    ExUnit.Assertions.assert(is_float(data), "Expected #{inspect(data)} is float")
  end
end
