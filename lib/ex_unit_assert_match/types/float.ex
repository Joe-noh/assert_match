defmodule ExUnitAssertMatch.Types.Float do
  defstruct []
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Float do
  @assertion_module Application.get_env(:ex_unit_assert_match, :assertion_module)

  def assert(_type, data) do
    @assertion_module.assert(is_float(data), "Expected #{inspect(data)} is float")
  end
end
