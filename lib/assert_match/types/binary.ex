defmodule AssertMatch.Types.Binary do
  defstruct []
end

defimpl AssertMatch.Type, for: AssertMatch.Types.Binary do
  require ExUnit.Assertions

  def assert(_type, data) do
    ExUnit.Assertions.assert(is_binary(data), "Expected #{inspect(data)} is binary")
  end
end
