> Note: `cpack` overlaps with Habitat's ability to package the application.  Once the build is
  complete, Habitat will process `do_install` which will install them into a place for Habitat to
  package the files into a `.hart`.  The steps below are shown for completeness.

## Prep the Habitat Studio with `cpack`

```
[][default:/src:0]# hab pkg binlink core/cmake cpack
» Binlinking cpack from core/cmake into /hab/bin
★ Binlinked cpack from core/cmake/3.6.2/20170514012000 to /hab/bin/cpack
```

## Build binary distribution

```
[][default:/src:0]# cpack --config /src/Step6/build/CPackConfig.cmake
CPack: Create package using STGZ
CPack: Install projects
CPack: - Run preinstall target for: Tutorial
CPack: - Install project: Tutorial
CPack: Create package
CPack: - package: /src/Tutorial-1.0.1-Linux.sh generated.
CPack: Create package using TGZ
CPack: Install projects
CPack: - Run preinstall target for: Tutorial
CPack: - Install project: Tutorial
CPack: Create package
CPack: - package: /src/Tutorial-1.0.1-Linux.tar.gz generated.
CPack: Create package using TZ
CPack: Install projects
CPack: - Run preinstall target for: Tutorial
CPack: - Install project: Tutorial
CPack: Create package
CPack: - package: /src/Tutorial-1.0.1-Linux.tar.Z generated.
[][default:/src:2]# tar -tvzf Tutorial-1.0.1-Linux.tar.gz
drwxr-xr-x 501/20            0 2017-12-30 00:52 Tutorial-1.0.1-Linux/bin/
-rwxr-xr-x 501/20        10560 2017-12-30 00:50 Tutorial-1.0.1-Linux/bin/Tutorial
-rw-r--r-- 501/20         2172 2017-12-30 00:50 Tutorial-1.0.1-Linux/bin/libMathFunctions.a
drwxr-xr-x 501/20            0 2017-12-30 00:52 Tutorial-1.0.1-Linux/include/
-rw-r--r-- 501/20           25 2017-12-30 00:42 Tutorial-1.0.1-Linux/include/MathFunctions.h
-rw-r--r-- 501/20          224 2017-12-30 00:50 Tutorial-1.0.1-Linux/include/TutorialConfig.h
```

## Create source distribution

```
[][default:/src:0]# cpack --config Step6/build/CPackSourceConfig.cmake
CPack: Create package using TBZ2
CPack: Install projects
CPack: - Install directory: /src/Step6
CPack: Create package
CPack: - package: /src/Tutorial-1.0.1-Source.tar.bz2 generated.
CPack: Create package using TGZ
CPack: Install projects
CPack: - Install directory: /src/Step6
CPack: Create package
CPack: - package: /src/Tutorial-1.0.1-Source.tar.gz generated.
CPack: Create package using TXZ
CPack: Install projects
CPack: - Install directory: /src/Step6
CPack: Create package
CPack: - package: /src/Tutorial-1.0.1-Source.tar.xz generated.
CPack: Create package using TZ
CPack: Install projects
CPack: - Install directory: /src/Step6
CPack: Create package
CPack: - package: /src/Tutorial-1.0.1-Source.tar.Z generated.
][default:/src:0]# tar -tvzf Tutorial-1.0.1-Source.tar.gz
drwxr-xr-x 501/20            0 2017-12-30 00:42 Tutorial-1.0.1-Source/habitat/
-rw-r--r-- 501/20          514 2017-12-30 00:47 Tutorial-1.0.1-Source/habitat/plan.sh
-rw-r--r-- 501/20         2244 2017-12-30 00:49 Tutorial-1.0.1-Source/CMakeLists.txt
-rw-r--r-- 501/20          285 2017-12-30 00:42 Tutorial-1.0.1-Source/TutorialConfig.h.in
-rw-r--r-- 501/20          714 2017-12-30 00:42 Tutorial-1.0.1-Source/tutorial.cxx
drwxr-xr-x 501/20            0 2017-12-30 00:42 Tutorial-1.0.1-Source/MathFunctions/
-rw-r--r-- 501/20          654 2017-12-30 00:42 Tutorial-1.0.1-Source/MathFunctions/MakeTable.cxx
-rw-r--r-- 501/20          747 2017-12-30 00:42 Tutorial-1.0.1-Source/MathFunctions/mysqrt.cxx
-rw-r--r-- 501/20          612 2017-12-30 00:42 Tutorial-1.0.1-Source/MathFunctions/CMakeLists.txt
-rw-r--r-- 501/20           25 2017-12-30 00:42 Tutorial-1.0.1-Source/MathFunctions/MathFunctions.h
-rw-r--r-- 501/20         1579 2017-12-30 00:59 Tutorial-1.0.1-Source/README.md
drwxr-xr-x 501/20            0 2017-12-30 00:50 Tutorial-1.0.1-Source/build/
-rwxr-xr-x 501/20        10560 2017-12-30 00:50 Tutorial-1.0.1-Source/build/Tutorial
drwxr-xr-x 501/20            0 2017-12-30 00:52 Tutorial-1.0.1-Source/build/CMakeFiles/
-rw-r--r-- 501/20           85 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/CMakeRuleHashes.txt
-rw-r--r-- 501/20           85 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/cmake.check_cache
-rw-r--r-- 501/20        59662 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/CMakeOutput.log
drwxr-xr-x 501/20            0 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/
-rwxr-xr-x 501/20         9600 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CMakeDetermineCompilerABI_CXX.bin
-rwxr-xr-x 501/20         9544 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CMakeDetermineCompilerABI_C.bin
drwxr-xr-x 501/20            0 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CompilerIdC/
-rw-r--r-- 501/20        16826 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CompilerIdC/CMakeCCompilerId.c
-rwxr-xr-x 501/20         9152 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CompilerIdC/a.out
drwxr-xr-x 501/20            0 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CompilerIdCXX/
-rwxr-xr-x 501/20         9440 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CompilerIdCXX/a.out
-rw-r--r-- 501/20        16397 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CompilerIdCXX/CMakeCXXCompilerId.cpp
-rw-r--r-- 501/20         4901 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CMakeCXXCompiler.cmake
-rw-r--r-- 501/20         2347 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CMakeCCompiler.cmake
-rw-r--r-- 501/20          406 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/3.6.2/CMakeSystem.cmake
-rwxr-xr-x 501/20        11520 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/feature_tests.bin
-rw-r--r-- 501/20          688 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/feature_tests.c
drwxr-xr-x 501/20            0 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/
-rw-r--r-- 501/20          655 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/DependInfo.cmake
-rw-r--r-- 501/20          215 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/depend.internal
-rw-r--r-- 501/20          286 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/depend.make
-rw-r--r-- 501/20          250 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/cmake_clean.cmake
-rw-r--r-- 501/20          558 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/link.txt
-rw-r--r-- 501/20           43 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/progress.make
-rw-r--r-- 501/20          345 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/CXX.includecache
-rw-r--r-- 501/20         4468 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/build.make
-rw-r--r-- 501/20          478 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/flags.make
-rw-r--r-- 501/20         2192 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Tutorial.dir/tutorial.cxx.o
-rw-r--r-- 501/20        10080 2017-12-30 00:50 Tutorial-1.0.1-Source/build/CMakeFiles/Makefile.cmake
...
```
