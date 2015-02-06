defmodule TrellerTest do
  use ExUnit.Case
  use Plug.Test

  @otps Treller.init([])

  test "has root" do
    bubu = conn :get, "/"
    conn = Treller.call bubu, @opts

    assert conn.status    == 200
    assert conn.resp_body == "the service is available"
  end

end
