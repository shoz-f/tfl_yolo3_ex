defmodule TflYolo3 do
  @moduledoc """
  Documentation for `TflYolo3`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TflYolo3.hello()
      :world

  """
  def hello do
    :world
  end
  
  def preprocess(fname) do
    struct(Npy, CImg.create(fname) |> CImg.resize([416,416]) |> CImg.to_flatbin)
  end
end
