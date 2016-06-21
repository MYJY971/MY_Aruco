# Install script for directory: C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/bin/Debug/aruco207.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/bin/Release/aruco207.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/bin/MinSizeRel/aruco207.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/bin/RelWithDebInfo/aruco207.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/bin/Debug/aruco207.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/bin/Release/aruco207.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/bin/MinSizeRel/aruco207.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/MY-Build/bin/RelWithDebInfo/aruco207.dll")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aruco" TYPE FILE FILES
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/aruco.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/ar_omp.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/cameraparameters.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/cvdrawingutils.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/dictionary.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/exports.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/levmarq.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/marker.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/markerdetector.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/markerlabeler.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/markermap.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/posetracker.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/markerlabelers/dictionary_based.h"
    "C:/Stage/Yanis/CSharp_projects/Librairies/ARUCO/aruco-2.0.7/src/markerlabelers/svmmarkers.h"
    )
endif()

