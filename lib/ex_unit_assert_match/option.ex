defmodule ExUnitAssertMatch.Option do
  @moduledoc false

  defstruct assertion_module: ExUnit.Assertions,
            key_stack: []
end
