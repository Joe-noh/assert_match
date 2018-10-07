defmodule ExUnitAssertMatch do
  @moduledoc """
  Documentation for ExUnitAssertMatch.
  """

  alias ExUnitAssertMatch.Types

  def assert(left, right, opts \\ []) do
    ExUnitAssertMatch.Type.assert(left, right, opts)
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
