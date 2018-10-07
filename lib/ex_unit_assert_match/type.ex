defprotocol ExUnitAssertMatch.Type do
  @doc """
  Asserts given `data` match `expected_type`.
  """
  def assert(type, data, opts \\ [])
end
