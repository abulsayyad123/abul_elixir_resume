defmodule AbulasarResume.Jobs.TaskRunner do
  use GenServer
  alias AbulasarResumeWeb.BackgroundLoaderComponent
  import Phoenix.LiveView
  alias Phoenix.PubSub

  defmodule State do
    defstruct [
      live_view_pid: nil, job_progress: 0
    ]
  end

  # Client
  def start_link(_args) do
    GenServer.start_link(__MODULE__, %State{} , name: __MODULE__)
  end

  def start_job(live_view_pid) do
    GenServer.cast(__MODULE__, {:start_job, live_view_pid})
  end

  # Server
  @impl true
  def init(jobs) do
    {:ok, jobs}
  end

  @impl true
  def handle_cast({:start_job, live_view_pid}, job) do
    updated_job = Map.put(job, :live_view_pid, live_view_pid)
    :timer.send_interval(1000, self(), :tick)
    {:noreply, updated_job}
  end

  @impl true
  def handle_info(:tick, job) do
    new_updated_job = Map.put(job, :job_progress, job.job_progress + 1)
    send_update(job.live_view_pid, BackgroundLoaderComponent, id: "background-loader", brightness: new_updated_job.job_progress)
    IO.puts "still in progress"
    {:noreply, new_updated_job}
  end

end
