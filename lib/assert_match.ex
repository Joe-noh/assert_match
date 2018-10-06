defmodule AssertMatch do
  @moduledoc """
  Documentation for AssertMatch.
  """

  require ExUnit.Assertions
  alias AssertMatch.Types

  def assert(left, right) do
    case left do
      %Types.Map{expected: nil} ->
        ExUnit.Assertions.assert(is_map(right), "Expected #{inspect(right)} is map")

      %Types.Map{expected: expected} ->
        Enum.each(expected, fn {key, val} ->
          AssertMatch.assert(val, Map.get(right, key))
        end)

      %Types.List{expected: nil} ->
        ExUnit.Assertions.assert(is_list(right), "Expected #{inspect(right)} is list")

      %Types.List{expected: expected} ->
        Enum.each(right, fn elem ->
          AssertMatch.assert(expected, elem)
        end)

      %Types.Binary{} ->
        ExUnit.Assertions.assert(is_binary(right), "Expected #{inspect(right)} is binary")

      %Types.Integer{} ->
        ExUnit.Assertions.assert(is_integer(right), "Expected #{inspect(right)} is integer")

      %Types.Float{} ->
        ExUnit.Assertions.assert(is_float(right), "Expected #{inspect(right)} is float")
    end
  end

  def map(expected) do
    %Types.Map{expected: expected}
  end

  def list() do
    %Types.List{expected: nil}
  end

  def list_of(expected) do
    %Types.List{expected: expected}
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
end
