defmodule ExUnitAssertMatch.Types.Map do
  defstruct [:expected]
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Map do
  @assertion_module Application.get_env(:ex_unit_assert_match, :assertion_module)

  def assert(%ExUnitAssertMatch.Types.Map{expected: nil}, data) do
    @assertion_module.assert(is_map(data), "Expected #{inspect(data)} is map")
  end

  def assert(%ExUnitAssertMatch.Types.Map{expected: expected}, data) do
    Enum.each(expected, fn {key, val} ->
      ExUnitAssertMatch.assert(val, Map.get(data, key))
    end)
  end
end
