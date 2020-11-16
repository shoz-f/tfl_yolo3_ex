# TflYolo3

Tensorflow lite YOLO v3 application in Elixir

## Platform
- Windows MSYS2/MinGW64

## Requirement
It needs following libraries to build this application.

Packages:
- nlohmann/json: JSON for Modern C++
- libjpeg

You can install these packages with pacman.


Extra libraries:
- CImg:           http://cimg.eu/download.shtml
- tensorflow_src: https://github.com/tensorflow/tensorflow.git

There is the install script "setup_mingw_extra.sh" in ./extra.
Please run this command line under MSYS2/MinGW.

> cd ./extra<br>
source setup_mingw_extra.sh


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tfl_yolo3` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tfl_yolo3, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/tfl_yolo3](https://hexdocs.pm/tfl_yolo3).

