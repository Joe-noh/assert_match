defmodule ExUnitAssertMatch.Types.List do
  defstruct [:example]

  def assert_self(%__MODULE__{}, data, opts) do
    data |> is_list() |> opts.assertion_module.assert("Expected #{inspect(data)} is list")
  end

  def assert_children(%__MODULE__{example: nil}, _data, _opts) do
  end
  def assert_children(%__MODULE__{example: example}, data, opts) do
    Enum.each(data, fn elem ->
      ExUnitAssertMatch.assert(example, elem, opts)
    end)
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.List do
  def assert(type, data, opts \\ []) do
    ExUnitAssertMatch.Types.List.assert_self(type, data, opts)
    ExUnitAssertMatch.Types.List.assert_children(type, data, opts)
  end
end
