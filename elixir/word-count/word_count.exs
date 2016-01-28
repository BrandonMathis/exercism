require IEx

defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(words) do
    words
    |> String.split
    |> strip_punctuation
    |> count_words
  end

  def count_words(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  def strip_punctuation(words) do
    list = Enum.map(words, &capture_word/1)
    Enum.reject(list, &(nil == (&1)))
    |> List.flatten
  end

  def capture_word(word) do
    Regex.run(~r/[\w]+/, word)
  end

  def update_count(word, acc) do
    Map.update acc, word, 1, &(&1+1)
  end
end
