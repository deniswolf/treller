defmodule Treller do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "the service is available")
  end

  post "/" do
    case read_body(conn) do
      {:ok, "", conn} ->
        send_resp(conn, 403, "no commits were found")
    end
  end

  match _ do
    send_resp conn, 404, "not found"
  end

end
