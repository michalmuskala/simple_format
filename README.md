# SimpleFormat

Rail's simple_format helper for Phoenix.HTML

## Usage

In the view:

    import SimpleFormat

In the template:

    <%= simple_format @message %>

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add simple_format to your list of dependencies in `mix.exs`:

        def deps do
          [{:simple_format, "~> 0.0.1"}]
        end

  2. Ensure simple_format is started before your application:

        def application do
          [applications: [:simple_format]]
        end
