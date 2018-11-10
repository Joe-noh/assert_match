defmodule ExUnitAssertMatch.Types.Binary do
  @moduledoc false

  defstruct regex: nil

  def assert_self(%__MODULE__{regex: regex}, data, opts, state) do
    message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} is binary", state)

    data
    |> is_binary()
    |> opts.assertion_module.assert(message)

    if Regex.regex?(regex) do
      message = ExUnitAssertMatch.ErrorMessage.build("Expected #{inspect(data)} to match #{inspect(regex)}", state)
      opts.assertion_module.assert Regex.match?(regex, data), message
    end
  end
end

defimpl ExUnitAssertMatch.Type, for: ExUnitAssertMatch.Types.Binary do
  def assert(type, data, opts, state) do
    ExUnitAssertMatch.Types.Binary.assert_self(type, data, opts, state)
  end
end
