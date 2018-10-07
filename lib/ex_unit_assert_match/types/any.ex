defmodule ExUnitAssertMatch.Types.Any do
  @moduledoc false

  defstruct []
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Any do
  def assert(_type, _data, _opts \\ []) do
    # do nothing
  end
end
