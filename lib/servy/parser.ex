defmodule Servy.Parser do
  alias Servy.Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\n\n")

    [request_line | header_lines] = String.split(top, "\n")

    [method, path, _version] = String.split(request_line, " ")

    headers = parse_headers(header_lines)

    params = parse_params(headers["Content-Type"], params_string)

    %Conv{
      method: method,
      path: path,
      params: params,
      headers: headers
    }
  end

  def parse_params("application/x-www-form-urlencoded", params_string) do
    params_string |> String.trim() |> URI.decode_query()
  end

  def parse_params(_content_type, _params_string), do: %{}

  def parse_headers(header_lines) do
    Enum.reduce(header_lines, %{}, fn line, acc ->
      [key, val] = String.split(line, ": ")
      Map.put(acc, key, val)
    end)
  end

  # def parse_headers(header_lines, headers \\ %{})

  # def parse_headers([h | t], headers) do
  #   [key, val] = String.split(h, ": ")
  #   parse_headers(t, Map.put(headers, key, val))
  # end

  # def parse_headers([], headers), do: headers
end
