defmodule ExUnitAssertMatch.Types.List do
  defstruct [:expected]
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.List do
  @assertion_module Application.get_env(:ex_unit_assert_match, :assertion_module)

  def assert(%ExUnitAssertMatch.Types.List{expected: nil}, data) do
    @assertion_module.assert(is_list(data), "Expected #{inspect(data)} is list")
  end

  def assert(%ExUnitAssertMatch.Types.List{expected: expected}, data) do
    Enum.each(data, &ExUnitAssertMatch.assert(expected, &1))
  end
end
