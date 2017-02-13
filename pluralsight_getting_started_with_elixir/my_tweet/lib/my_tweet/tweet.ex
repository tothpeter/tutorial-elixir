defmodule MyTweet.Tweet do
  def send(str) do
    ExTwitter.update str
  end

  def send_random(file) do
    MyTweet.FileReader.get_string_to_tweet(file)
    |> send
  end
end
