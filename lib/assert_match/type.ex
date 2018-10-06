defprotocol AssertMatch.Type do
  @doc """
  Asserts given `data` match `expected_type`.
  """
  def assert(type, data)
end
