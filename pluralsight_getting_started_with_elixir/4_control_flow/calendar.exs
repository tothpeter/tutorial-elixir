defmodule Sample.Calendar do
  def day_abbr(day) do
    cond do
      day == :monday -> "M"
      day == :tuesday -> "Mu"
      true -> "Invalid"
    end
  end

  def day_abbr2(day) do
    case day do
      :monday -> "M"
      :tuesday -> "Tues"
      _ -> "Invalid"
    end
  end

  def describe_date(date) do
    case date do
      {1, _, _} -> "Very first day of month"
      {_, month, _} when month == 9 -> "I was born in Sept"
      {_, _, _} -> "Noooo"
    end
  end

  def file_opener(path) do
    case File.read(path) do
      {:ok, data} -> IO.puts data
      {:error, error} -> IO.puts error
    end
  end
end


# IO.inspect Sample.Calendar.day_abbr(:monday)
# IO.inspect Sample.Calendar.day_abbr2(:monday2)
# IO.inspect Sample.Calendar.describe_date({11, 9, 1988})
# IO.inspect File.cwd
IO.inspect Sample.Calendar.file_opener("README.md")
