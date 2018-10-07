defprotocol ExUnitAssertMatch.Type do
  @doc """
  Asserts given `data` match `type`.
  """
  def assert(type, data, opts \\ [])
end
