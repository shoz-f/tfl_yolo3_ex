defmodule TflYolo3.TflInterp do
  use GenServer
  
  @timeout 300000
  
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def predict(img_file) do
    GenServer.call(__MODULE__, {:predict, img_file}, @timeout)
  end


  def init(opts) do
    executable = Application.app_dir(:tfl_yolo3, "priv/tfl_interp")
    tfl_model  = Application.app_dir(:tfl_yolo3, Keyword.get(opts, :model))
    tfl_opts   = Keyword.get(opts, :opts, "")

    port = Port.open({:spawn_executable, executable}, [
      {:args, String.split(tfl_opts) ++ ["-p", tfl_model]},
      {:packet, 4},
      :binary
    ])

    {:ok, %{port: port}}
  end

  def handle_call({:predict, img_file}, _from, state) do
    Port.command(state.port, "predict #{img_file}")
    response = receive do
      {_, {:data, <<response::binary>>}} ->
        {:ok, ans} = Jason.decode(response)
        if Map.has_key?(ans, "error"), do: {:error, ans["error"]}, else: {:ok, ans}
    after
      @timeout -> {:timeout}
    end

    {:reply, response, state}
  end
end
