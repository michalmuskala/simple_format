**DEPRECATED**:
this project is deprecated as it's functionality was merged
directly into `phoenix_html` as
[Phoenix.HTML.Format.text_to_html/2](http://hexdocs.pm/phoenix_html/Phoenix.HTML.Format.html#text_to_html/2)

# SimpleFormat

Rail's simple_format helper for Phoenix.HTML

## Usage

In the view:
```elixir
import SimpleFormat
```

In the template:
```elixir
<%= simple_format @message %>
```

## Installation

  1. Add simple_format to your list of dependencies in `mix.exs`:
    ```elixir
    def deps do
      [{:simple_format, "~> 0.1"}]
    end
    ```

  2. Ensure simple_format is started before your application:
    ```elixir
    def application do
      [applications: [:simple_format]]
    end
    ```

## License

Copyright 2015 Michał Muskała

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
