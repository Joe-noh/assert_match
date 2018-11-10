defmodule ExUnitAssertMatch.Types.Any do
  @moduledoc false

  defstruct []
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Any do
  def assert(_type, _data, _opts, _state) do
    # Do nothing. Always pass.
  end
end
