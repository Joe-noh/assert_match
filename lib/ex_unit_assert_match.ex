defmodule ExUnitAssertMatch do
  @moduledoc """
  Provedes functionality to assert that given data structure is as expected.

  The usage is on [README](./readme.html#usage).
  """

  alias ExUnitAssertMatch.Types

  @doc """
  Assert that given `data` match `type` specification.

      alias ExUnitAssertMatch, as: Match

      Match.assert Match.binary(), "Hello"
      #=> pass

      Match.assert Match.binary(), 123
      #=> fail

  This calls ExUnit `assert` macro internally.
  """
  def assert(type, data, opts \\ [])

  def assert(type, data, opts = %ExUnitAssertMatch.Option{}) do
    ExUnitAssertMatch.Type.assert(type, data, opts)
  end

  def assert(type, data, opts) do
    assert(type, data, struct(ExUnitAssertMatch.Option, opts))
  end

  @doc """
  Matches any map.
  """
  def map() do
    %Types.Map{example: nil}
  end

  @doc """
  Matches a map that satisfies `example` specification.

      alias ExUnitAssertMatch, as: Match

      Match.assert Match.map(%{name: Match.binary()}), %{name: "John"}
      #=> pass

      Match.assert Match.map(%{name: Match.binary()}), %{name: nil}
      #=> fail
  """
  def map(example) do
    %Types.Map{example: example}
  end

  @doc """
  Matches any list.
  """
  def list() do
    %Types.List{example: nil}
  end

  @doc """
  Matches a list that satisfies `example` specification.

      alias ExUnitAssertMatch, as: Match

      Match.assert Match.list_of(Match.binary()), ["1", "2"]
      #=> pass

      Match.assert Match.list_of(Match.binary()), ["1", 2]
      #=> fail
  """
  def list_of(example) do
    %Types.List{example: example}
  end

  @doc """
  Matches any atom.
  """
  def atom() do
    %Types.Atom{}
  end

  @doc """
  Matches any binary.
  """
  def binary() do
    %Types.Binary{}
  end

  @doc """
  Matches any integer.
  """
  def integer() do
    %Types.Integer{}
  end

  @doc """
  Matches any float.
  """
  def float() do
    %Types.Float{}
  end

  @doc """
  Matches if they are equal.
  This uses `==` to compare them.
  """
  def literal(example) do
    %Types.Literal{example: example}
  end

  @doc """
  Same as `literal/1`.
  """
  def equal(example) do
    literal(example)
  end

  @doc """
  Matches if it satisfies `example` or equals to `nil`.
  """
  def nullable(example) do
    %Types.Nullable{example: example}
  end

  @doc """
  Matches everything.
  """
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
