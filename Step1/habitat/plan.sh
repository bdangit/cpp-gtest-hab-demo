pkg_name=cpp-cmake-tutorial-step1
pkg_origin=bdangit
pkg_version=0.1.0
pkg_license=('MIT')
pkg_build_deps=(
  core/gcc
  core/cmake
  core/make
)
pkg_deps=(
  core/glibc
  core/gcc-libs
)

BUILDDIR='build'

# There is no default implementation of this callback. At this point in the
# build process, the tarball source has been downloaded, unpacked, and the build
# environment variables have been set, so you can use this callback to perform
# any actions before the package starts building, such as exporting variables,
# adding symlinks, and so on.
# @see https://www.habitat.sh/docs/reference/plan-syntax/#callbacks
# @see https://github.com/habitat-sh/habitat/blob/master/components/plan-build/bin/hab-plan-build.sh
do_prepare() {
  rm -rf "${BUILDDIR}"
}


do_build() {
  mkdir -p "${BUILDDIR}"
  cmake -H./ \
    -B${BUILDDIR} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}"
  make -C "${BUILDDIR}"
}

do_install() {
  return 0
}
