cmake_minimum_required(VERSION 3.12)
project(JitterbugPairProject)

# Add your source files here
set(SOURCES
    JitterbugPair/main.c
)

# Add any additional include directories here
include_directories(Libraries/include Libraries/libimobiledevice)

add_executable(jitterbugpair ${SOURCES})

find_package(PkgConfig REQUIRED)

# Add MbedTLS
find_package(MbedTLS REQUIRED)
include_directories(${MbedTLS_INCLUDE_DIRS})
target_link_libraries(jitterbugpair ${MbedTLS_LIBRARIES})

# Add libusbmuxd
pkg_check_modules(libusbmuxd REQUIRED libusbmuxd)
target_link_libraries(jitterbugpair ${libusbmuxd_LIBRARIES})
target_include_directories(jitterbugpair PUBLIC ${libusbmuxd_INCLUDE_DIRS})

# Add libimobiledevice
pkg_check_modules(libimobiledevice REQUIRED libimobiledevice)
target_link_libraries(jitterbugpair ${libimobiledevice_LIBRARIES})
target_include_directories(jitterbugpair PUBLIC ${libimobiledevice_INCLUDE_DIRS})
