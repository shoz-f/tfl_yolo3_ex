# TflYolo3

Tensorflow lite YOLO v3 application in Elixir

## Platform
- Windows MSYS2/MinGW64
- Ubuntu on WSL2

## Requirement
It needs following libraries to build this application.

Standard Packages:
- nlohmann/json: JSON for Modern C++
- libjpeg

You can install these by the packager, pacman or apt.


Extra libraries:
- CImg:           http://cimg.eu/download.shtml
- tensorflow_src: https://github.com/tensorflow/tensorflow.git

There is the installation script in ./extra.
Please run following commands for your OS.

For MSYS2/MinGW64
  $ cd ./extra
  $ source setup_mingw_extra.sh

For Ubuntu on WSL2
  $ cd ./extra
  $ source setup_wsl_extra.sh


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

