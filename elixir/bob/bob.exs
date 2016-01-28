defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r/^[\s]*$/, input) -> "Fine. Be that way!"
      Regex.match?(~r/^[\d|\w|\s]*\?$/, input) -> "Sure."
      Regex.match?(~r/^[1-9|\W]+$/, input) -> "Whatever."
      Regex.match?(~r/^[A-Z|\d]{1}[\d|\W]*[A-Z|\s|\W|\d]*$/, input) -> "Whoa, chill out!"
      Regex.match?(~r/^[\w]*$/u, input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
