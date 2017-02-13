defmodule MyTweet.FileReader do
  def get_string_to_tweet(path) do
    File.read!(path)
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(fn(item) -> String.length(item) > 0 && String.length(item) <= 140 end)
    |> Enum.random
  end
end
