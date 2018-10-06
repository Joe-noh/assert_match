defmodule AssertMatch.Types.Map do
  defstruct [:expected]
end

defimpl AssertMatch.Type, for: AssertMatch.Types.Map do
  require ExUnit.Assertions

  def assert(%AssertMatch.Types.Map{expected: nil}, data) do
    ExUnit.Assertions.assert(is_map(data), "Expected #{inspect(data)} is map")
  end

  def assert(%AssertMatch.Types.Map{expected: expected}, data) do
    Enum.each(expected, fn {key, val} ->
      AssertMatch.assert(val, Map.get(data, key))
    end)
  end
end
