pkg_name=cpp-cmake-tutorial-step6
pkg_origin=bdangit
pkg_version=0.1.0
pkg_license=('BSD-3-Clause')
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

do_check() {
  make -C "${BUILDDIR}" test
}

do_install() {
  make -C "${BUILDDIR}" install
}
