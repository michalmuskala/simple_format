defmodule SimpleFormatTest do
  use ExUnit.Case, async: true
  doctest SimpleFormat

  test "wraps paragraphs" do
    formatted =
      format("""
      Hello,

      Sign this contract.

      Regards,
      Michał.
      """)

    assert formatted == """
    <p>Hello,</p>
    <p>Sign this contract.</p>
    <p>Regards,<br>
    Michał.</p>
    """
  end

  test "escapes html" do
    formatted =
      format("""
      <script></script>
      """)

    assert formatted == """
    <p>&lt;script&gt;&lt;/script&gt;</p>
    """
  end

  test "adds brs" do
    formatted =
      format("""
      Hello,
      This is dog,
      How can I help you?


      """)

    assert formatted == """
    <p>Hello,<br>
    This is dog,<br>
    How can I help you?</p>
    """
  end

  defp format(text) do
    text |> SimpleFormat.simple_format |> Phoenix.HTML.safe_to_string
  end
end
