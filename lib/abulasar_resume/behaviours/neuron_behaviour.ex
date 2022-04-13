defmodule AbulasarResume.Behaviours.NeuronBehaviour do
  @callback query(query_string :: String.t()) ::
          {:ok, Neuron.Response.t()}
          | {:error, Neuron.Response.t() | Neuron.JSONParseError.t() | HTTPoison.Error.t()}
end
