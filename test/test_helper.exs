defmodule ExUnitAssertMatch.ThrowTupleOnFail do
  def assert(bool, message \\ "")
  def assert(true, message), do: {:ok, message}
  def assert(false, message), do: throw({:error, message})

  def refute(bool, message \\ "")
  def refute(true, message), do: throw({:error, message})
  def refute(false, message), do: {:ok, message}
end

ExUnit.start()
