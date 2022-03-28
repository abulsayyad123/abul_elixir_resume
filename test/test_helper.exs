ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(AbulasarResume.Repo, :manual)

Application.ensure_all_started(:mox)

Mox.defmock(Test.NeuronMock, for: AbulasarResume.Behaviours.NeuronBehaviour)
