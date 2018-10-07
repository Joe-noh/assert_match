defprotocol ExUnitAssertMatch.Type do
  @moduledoc false

  @doc """
  Asserts given `data` match `type`.
  """
  def assert(type, data, opts \\ [])
end
