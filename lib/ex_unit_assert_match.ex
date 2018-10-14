defmodule ExUnitAssertMatch do
  @moduledoc """
  Provedes functionality to assert that given data structure is as expected.

  The usage is on [README](./readme.html#usage).
  """

  alias ExUnitAssertMatch.Types

  def assert(type, data, opts \\ [])

  def assert(type, data, opts = %ExUnitAssertMatch.Option{}) do
    ExUnitAssertMatch.Type.assert(type, data, opts)
  end

  def assert(type, data, opts) do
    assert(type, data, struct(ExUnitAssertMatch.Option, opts))
  end

  def map() do
    %Types.Map{example: nil}
  end

  def map(example) do
    %Types.Map{example: example}
  end

  def list() do
    %Types.List{example: nil}
  end

  def list_of(example) do
    %Types.List{example: example}
  end

  def atom() do
    %Types.Atom{}
  end

  def binary() do
    %Types.Binary{}
  end

  def integer() do
    %Types.Integer{}
  end

  def float() do
    %Types.Float{}
  end

  def literal(example) do
    %Types.Literal{example: example}
  end

  def nullable(example) do
    %Types.Nullable{example: example}
  end

  def any() do
    %Types.Any{}
  end

  Enum.each(~w[map list atom binary integer float]a, fn type ->
    name = String.to_atom("nullable_" <> to_string(type))

    @doc """
    Helper function to call `nullable(#{type}())`.
    """
    def unquote(name)() do
      nullable(unquote(type)())
    end
  end)

  Enum.each(~w[map list_of literal]a, fn type ->
    name = String.to_atom("nullable_" <> to_string(type))

    @doc """
    Helper function to call `nullable(#{type}(example))`.
    """
    def unquote(name)(example) do
      nullable(unquote(type)(example))
    end
  end)
end
