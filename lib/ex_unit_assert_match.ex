defmodule ExUnitAssertMatch do
  @moduledoc """
  Documentation for ExUnitAssertMatch.
  """

  alias ExUnitAssertMatch.Types

  def assert(left, right, opts \\ []) do
    ExUnitAssertMatch.Type.assert(left, right, opts)
  end

  def map() do
    %Types.Map{expected: nil}
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
