defmodule TflYolo3.Router do
  use Plug.Router
  
  alias TflYolo3.TflInterp

  @photo_file  if Mix.target() == :host, do: Application.app_dir(:tfl_yolo3, "priv/photo.jpg"), else: "/root/photo.jpg"
  @result_file if Mix.target() == :host, do: Application.app_dir(:tfl_yolo3, "priv/result.jpg"), else: "/root/result.jpg"

  plug Plug.Static.IndexHtml, at: "/"
  plug Plug.Static, at: "/", from: :tfl_yolo3

  plug :match
  plug Plug.Parsers, parsers: [:urlencoded, :multipart, :json],
                     pass: ["text/*"],
                     json_decoder: Jason
  plug :dispatch

  get "/photo.jpg" do
    conn
    |> put_resp_header("content-type", "image/jpeg")
    |> send_file(200, @photo_file)
  end

  get "/result.jpg" do
    conn
    |> put_resp_header("content-type", "image/jpeg")
    |> send_file(200, @result_file)
  end

  post "/predict_photo" do
    with \
      :ok <- File.cp(conn.params["photo"].path, @photo_file),
      {:ok, ans} <- TflInterp.predict(@photo_file)
    do
      result_photo(ans)
      send_resp(conn, 200, Jason.encode!(%{"ans" => ans}))
    else
      _ ->
        send_resp(conn, 200, "error")
    end
  end

  match _ do
    IO.inspect(conn)
    send_resp(conn, 404, "Oops!")
  end
  
  def result_photo(ans) do
    boxes =
      Map.values(ans)
      |> Enum.reduce([], fn x,acc -> acc ++ x end)

    with photo <- CImg.create(@photo_file)
    do
      Enum.each(boxes, fn
        [x0,y0,x1,y1] -> CImg.draw_box(photo, x0, y0, x1, y1, {255,0,0})
      end)
      CImg.save(photo, @result_file)
    end
  end
end
