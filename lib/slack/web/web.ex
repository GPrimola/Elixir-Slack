defmodule Slack.Web do
  @moduledoc false

  def get_documentation do
    File.ls!("#{__DIR__}/docs")
    |> format_documentation
  end

  defp format_documentation(files) do
    Enum.reduce(files, %{}, fn file, module_names ->
      json =
        File.read!("#{__DIR__}/docs/#{file}")
        |> Jason.decode!(%{})

      doc = Slack.Web.Documentation.new(json, file)

      module_names
      |> Map.put_new(doc.module, [])
      |> update_in([doc.module], &(&1 ++ [doc]))
    end)
  end
end
