# Usage: . ./build.sh

export PATH=/home/arter97/android/ndk/arm64/bin:$PATH
export CC=aarch64-linux-android-clang
export CXX=aarch64-linux-android-clang++

export ADDR2LINE=aarch64-linux-android-addr2line
export AR=aarch64-linux-android-ar
export AS=aarch64-linux-android-as
export LD=aarch64-linux-android-ld
export NM=aarch64-linux-android-nm
export OBJCOPY=aarch64-linux-android-objcopy
export OBJDUMP=aarch64-linux-android-objdump
export RANLIB=aarch64-linux-android-ranlib
export READELF=aarch64-linux-android-readelf
export STRIP=aarch64-linux-android-strip

export CFLAGS="-O3 -march=armv8-a -mtune=cortex-a57"
export CPPFLAGS="-I/tmp/arm64/include"
export CXXFLAGS="-O3 -march=armv8-a -mtune=cortex-a57"
export LDFLAGS="-L/tmp/arm64/lib -static-libstdc++"
export ac_cv_c_bigendian=no
export ac_cv_file__git=no
export ac_cv_path_LLVM_AR=llvm-ar

export GYP_DEFINES="target_arch=arm64 v8_target_arch=arm64 android_target_arch=arm64 host_os=linux OS=android"
export CC_host=gcc
export CXX_host=g++
export LINK_host=g++
./configure \
  --dest-cpu=arm64 \
  --dest-os=android \
  --without-snapshot \
  --without-intl \
  --cross-compiling \
  --prefix=/tmp/node
sed -i -e "s@'want_separate_host_toolset': 0@'want_separate_host_toolset': 1@g" config.gypi
perl -p -i -e 's/LIBS := \$\(LIBS\)/LIBS := -lpthread/' \
  out/tools/v8_gypfiles/torque.host.mk \
  out/tools/v8_gypfiles/bytecode_builtins_list_generator.host.mk
