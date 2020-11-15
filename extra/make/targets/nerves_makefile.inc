# Settings for Raspberry Pi.
ifeq ($(TARGET),nerves)
  # Default to the architecture used on the Pi Two/Three (ArmV7), but override this
  # with TARGET_ARCH=armv6 to build for the Pi Zero or One.
  # TARGET_ARCH := armv6

  ifeq (, $(findstring "$(MIX_TARGET)","rpi" "rpi0" "rpi2" "rpi3"))
    $(error "unknown target: $(MIX_TARGET)")
  endif

  ifeq ("$(MIX_TARGET)", $(findstring "$(MIX_TARGET)","rpi" "rpi0"))
    TARGET_ARCH := armv6
    TARGET_TOOLCHAIN_PREFIX := armv6-rpi-linux-gnueabi-
    CXXFLAGS += \
      -march=armv6 \
      -mfpu=vfp \
      -funsafe-math-optimizations \
      -ftree-vectorize \
      -fPIC
    
    CFLAGS += \
      -march=armv6 \
      -mfpu=vfp \
      -funsafe-math-optimizations \
      -ftree-vectorize \
      -fPIC
    
    LDFLAGS := \
      -Wl,--no-export-dynamic \
      -Wl,--exclude-libs,ALL \
      -Wl,--gc-sections \
      -Wl,--as-needed
  endif

  ifeq ("$(MIX_TARGET)", $(findstring "$(MIX_TARGET)","rpi2" "rpi3"))
    TARGET_ARCH := armv7
    TARGET_TOOLCHAIN_PREFIX := arm-unknown-linux-gnueabihf-
    CXXFLAGS += \
      -march=armv7-a \
      -mfpu=neon-vfpv4 \
      -funsafe-math-optimizations \
      -ftree-vectorize \
      -fPIC

    CFLAGS += \
      -march=armv7-a \
      -mfpu=neon-vfpv4 \
      -funsafe-math-optimizations \
      -ftree-vectorize \
      -fPIC

    LDFLAGS := \
      -Wl,--no-export-dynamic \
      -Wl,--exclude-libs,ALL \
      -Wl,--gc-sections \
      -Wl,--as-needed
  endif

  LIBS := \
    -latomic \
    -lstdc++ \
    -lpthread \
    -lm \
    -ldl

endif
