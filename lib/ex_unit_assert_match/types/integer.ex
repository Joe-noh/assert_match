defmodule ExUnitAssertMatch.Types.Integer do
  defstruct []
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Integer do
  @assertion_module Application.get_env(:ex_unit_assert_match, :assertion_module)

  def assert(_type, data) do
    @assertion_module.assert(is_integer(data), "Expected #{inspect(data)} is integer")
  end
end
