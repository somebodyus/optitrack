# - Find OPTITRACK SDK
# Find the native OPTITRACK headers and libraries.
#
#  OPTITRACK_SDK_INCLUDE_DIRS - where to find NPTrackingTools.h
#  OPTITRACK_SDK_LIBRARIES    - List of libraries when using OPTITRACK.
#  OPTITRACK_SDK_BIN_DIRS     - where to find NPTrackingTools.dll or NPTrackingToolsx64.dll
#  OPTITRACK_SDK_FOUND        - True if OPTITRACK found.

SET(OPTITRACK_SDK_ROOT_DIR
    "${OPTITRACK_SDK_ROOT_DIR}"
    CACHE
    PATH
    "Root directory to search for OPTITRACK SDK")

# Look for the header file.
FIND_PATH(OPTITRACK_SDK_INCLUDE_DIRS NAMES NPTrackingTools.h HINTS 
	"${OPTITRACK_SDK_ROOT_DIR}/Motive/inc" )

	
IF(${CMAKE_SIZEOF_VOID_P} EQUAL 8)
	SET(LIB_NAME "NPTrackingToolsx64")
	SET(DLL_NAME "NPTrackingToolsx64.dll")
ELSEIF (${CMAKE_SIZEOF_VOID_P} EQUAL 4)
	SET(LIB_NAME "NPTrackingTools")
	SET(DLL_NAME "NPTrackingTools.dll")
ENDIF()

# Look for the dll files
FIND_PATH(OPTITRACK_SDK_BIN_DIRS NAMES ${DLL_NAME} HINTS "${OPTITRACK_SDK_ROOT_DIR}/Motive/lib" )

# Look for the library.
FIND_LIBRARY(OPTITRACK_SDK_LIBRARY NAMES ${LIB_NAME} HINTS "${OPTITRACK_SDK_ROOT_DIR}/Motive/lib")

MARK_AS_ADVANCED(OPTITRACK_SDK_LIBRARY)

SET(OPTITRACK_SDK_LIBRARIES optimized ${OPTITRACK_SDK_LIBRARY} debug ${OPTITRACK_SDK_LIBRARY})

# handle the QUIETLY and REQUIRED arguments and set OPTITRACK_SDK_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(OPTITRACK_SDK DEFAULT_MSG OPTITRACK_SDK_LIBRARIES OPTITRACK_SDK_INCLUDE_DIRS OPTITRACK_SDK_BIN_DIRS)

MARK_AS_ADVANCED(OPTITRACK_SDK_LIBRARIES OPTITRACK_SDK_INCLUDE_DIRS OPTITRACK_SDK_BIN_DIRS)
