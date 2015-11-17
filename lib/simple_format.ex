defmodule SimpleFormat do
  @moduledoc """
  Rail's simple_format helper for Phoenix.HTML

  For more documentation, please see SimpleFormat.simple_format/2
  """

  import Phoenix.HTML
  import Phoenix.HTML.Tag

  @doc ~S"""
  Rail's simple_format helper for Phoenix.HTML

  Returns text transformed into HTML using simple formatting rules.
  Two or more consecutive newlines (\\n\\n) are considered as a paragraph
  and wrapped in <p> tags. One newline (\\n) is considered as a linebreak
  and a <br> tag is appended.

  ## Usage

  In the view:

      import SimpleFormat

  In the template:

      <%= simple_format @message %>

  ## Examples

      iex> SimpleFormat.simple_format("Hello\n\nWorld") |> Phoenix.HTML.safe_to_string
      "<p>Hello</p>\n<p>World</p>\n"

      iex> SimpleFormat.simple_format("Hello\nWorld") |> Phoenix.HTML.safe_to_string
      "<p>Hello<br>\nWorld</p>\n"

      iex> opts = [wrapper_tag: :div, attributes: [class: "p"]]
      ...> SimpleFormat.simple_format("Hello\n\nWorld", opts) |> Phoenix.HTML.safe_to_string
      "<div class=\"p\">Hello</div>\n<div class=\"p\">World</div>\n"

  ## Options

    * `:escape` - if false does not html escape input (default: `true`)
    * `:wrapper_tag` - tag to wrap each parapgraph (default: `:p`)
    * `:attributes` - html attributes of the wrapper tag (default: `[]`)

  """
  @spec simple_format(String.t, Keyword.t) :: Phoenix.HTML.safe
  def simple_format(string, opts \\ []) do
    escape?     = Keyword.get(opts, :escape, true)
    wrapper_tag = Keyword.get(opts, :wrapper_tag, :p)
    attributes  = Keyword.get(opts, :attributes, [])

    string
    |> maybe_html_escape_to_string(escape?)
    |> String.split("\n\n", trim: true)
    |> Enum.filter_map(&not_blank?/1, &wrap_paragraph(&1, wrapper_tag, attributes))
    |> raw
  end

  defp maybe_html_escape_to_string(string, true) do
    string
    |> html_escape
    |> safe_to_string
  end

  defp maybe_html_escape_to_string(string, false) do
    string
  end

  defp not_blank?(" " <> rest),  do: not_blank?(rest)
  defp not_blank?("\n" <> rest), do: not_blank?(rest)
  defp not_blank?(""),           do: false
  defp not_blank?(_),            do: true

  defp wrap_paragraph(text, tag, attributes) do
    broken_text   = insert_brs(text)
    {:safe, data} = content_tag(tag, broken_text, attributes)
    [data, ?\n]
  end

  defp insert_brs(text) do
    text
    |> String.split("\n", trim: true)
    |> do_insert_brs
    |> raw
  end

  defp do_insert_brs([]),
    do: []
  defp do_insert_brs([last]),
    do: [last]
  defp do_insert_brs([head | tail]) do
    {:safe, tag} = tag(:br)
    [head, tag, ?\n | do_insert_brs(tail)]
  end

end
