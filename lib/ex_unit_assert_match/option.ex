defmodule ExUnitAssertMatch.Option do
  defstruct assertion_module: ExUnit.Assertions,
            key_stack: []
end
