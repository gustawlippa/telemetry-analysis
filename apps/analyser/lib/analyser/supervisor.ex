defmodule Analyser.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      Analyser.Worker,
      Analyser.Metrics
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
