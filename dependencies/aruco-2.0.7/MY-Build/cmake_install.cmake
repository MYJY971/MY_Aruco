# Install script for directory: C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/aruco")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake" TYPE FILE FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/Findaruco.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/aruco-uninstalled.pc"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/aruco.pc"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/src/cmake_install.cmake")
  include("C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/utils/cmake_install.cmake")
  include("C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/utils_markermap/cmake_install.cmake")
  include("C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/utils_calibration/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
