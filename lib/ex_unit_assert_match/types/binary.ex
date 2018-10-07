defmodule ExUnitAssertMatch.Types.Binary do
  defstruct []
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Binary do
  @assertion_module Application.get_env(:ex_unit_assert_match, :assertion_module)

  def assert(_type, data) do
    @assertion_module.assert(is_binary(data), "Expected #{inspect(data)} is binary")
  end
end
