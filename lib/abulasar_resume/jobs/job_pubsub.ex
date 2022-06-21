defmodule  AbulasarResume.Jobs.JobPubSub do

  def subscribe() do
    Phoenix.PubSub.subscribe(AbulasarResume.PubSub, "job_progress")
  end
end
