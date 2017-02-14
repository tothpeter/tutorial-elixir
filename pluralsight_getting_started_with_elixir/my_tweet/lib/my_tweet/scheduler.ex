defmodule MyTweet.Scheduler do
  def schedule_file(schedule, file) do
    Quantum.add_job(schedule, fn ->
      file
      |> MyTweet.FileReader.get_string_to_tweet
      |> MyTweet.TweetServer.tweet
    end)
  end
end
