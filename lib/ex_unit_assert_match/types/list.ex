defmodule ExUnitAssertMatch.Types.List do
  defstruct [:expected]
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.List do
  require ExUnit.Assertions

  def assert(%ExUnitAssertMatch.Types.List{expected: nil}, data) do
    ExUnit.Assertions.assert(is_list(data), "Expected #{inspect(data)} is list")
  end

  def assert(%ExUnitAssertMatch.Types.List{expected: expected}, data) do
    Enum.each(data, &ExUnitAssertMatch.assert(expected, &1))
  end
end
