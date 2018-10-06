defmodule AssertMatch do
  @moduledoc """
  Documentation for AssertMatch.
  """

  require ExUnit.Assertions
  alias AssertMatch.Types

  def assert(left, right) do
    AssertMatch.Type.assert left, right
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
