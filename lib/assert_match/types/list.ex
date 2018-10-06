defmodule AssertMatch.Types.List do
  defstruct [:expected]
end

defimpl AssertMatch.Type, for: AssertMatch.Types.List do
  require ExUnit.Assertions

  def assert(%AssertMatch.Types.List{expected: nil}, data) do
    ExUnit.Assertions.assert(is_list(data), "Expected #{inspect(data)} is list")
  end

  def assert(%AssertMatch.Types.List{expected: expected}, data) do
    Enum.each(data, &AssertMatch.assert(expected, &1))
  end
end
