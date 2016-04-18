defmodule Teenager do
  defdelegate yelling?(statement),  to: SentenceType
  defdelegate silence?(statement),  to: SentenceType
  defdelegate question?(statement), to: SentenceType

  def hey(statement) do
    cond do
      silence?(statement)  -> answer_for_silence
      yelling?(statement)  -> frightened_answer
      question?(statement) -> question_answer
      true                 -> default_answer
    end
  end

  defp frightened_answer do
    "Woah, chill out!"
  end

  defp question_answer do
    "Sure."
  end

  defp answer_for_silence do
    "Fine. Be that way."
  end

  defp default_answer do
    "Whatever."
  end
end

defmodule SentenceType do
  def yelling?(statement) do
    statement |> String.upcase == statement
  end

  def question?(statement) do
    statement |> String.ends_with?("?")
  end

  def silence?(statement) do
    statement == ""
  end
end
