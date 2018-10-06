defmodule ExUnitAssertMatch.Types.Binary do
  defstruct []
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Binary do
  require ExUnit.Assertions

  def assert(_type, data) do
    ExUnit.Assertions.assert(is_binary(data), "Expected #{inspect(data)} is binary")
  end
end
