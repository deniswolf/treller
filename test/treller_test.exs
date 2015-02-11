defmodule TrellerTest do
  use ExUnit.Case
  use Plug.Test

  @json_header [{"content-type", "application/json"}]

  test "has root" do
    bubu = conn :get, "/"
    conn = Treller.call bubu, nil

    assert conn.status    == 200
    assert conn.resp_body == "the service is available"
  end

  test "returns Error status on empty commits post" do
    conn = conn :post, "/", "", headers: @json_header
    conn = Treller.call conn, nil

    assert conn.status    == 403
    assert conn.resp_body == "no commits were found"
  end

end
