# Tensorflow lite YOLO v3 for Elixir

Tensorflow lite YOLO v3 application in Elixir

## Platform
- Windows MSYS2/MinGW64
- Ubuntu on WSL2

## Requirement
It needs following libraries to build this application.

#### Libraries available as a package:
- libjpeg
- nlohmann/json: JSON for Modern C++

You can install these libraries by the packge manager, pacman, apt and so on.


#### Libraries in source:
- CImg:           http://cimg.eu/download.shtml
- tensorflow_src: https://github.com/tensorflow/tensorflow.git

You get these libraries in source and need to build them.

There is the installation script in ./extra for your convenience.<br>
It downloads the sources, builds them and put them in suitable directories.<br>
You just run following command line depending on your OS.

MSYS2/MinGW64:

```bash
$ cd ./extra
$ source setup_mingw_extra.sh
```

Ubuntu on WSL2:

```bash
$ cd ./extra
$ source setup_wsl_extra.sh
```

## Where can i get YOLO v3 model for Tensorflow lite?
You can find the "yolov3-416.tflite" on the Release page in this repository.<br>
Donwload it and put it into "./priv" of the project.

Or, you can convert the Tensorflow YOLO v3 model to tflite also.

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
