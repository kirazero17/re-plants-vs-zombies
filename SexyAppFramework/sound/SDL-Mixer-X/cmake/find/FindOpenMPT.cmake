# - Try to find libopenmpt
# Once done this will define
#  OPENMPT_FOUND - System has libopenmpt
#  OPENMPT_INCLUDE_DIRS - The libopenmpt include directories
#  OPENMPT_LIBRARIES - The libraries needed to use libopenmpt

find_path(OPENMPT_INCLUDE_DIR "libopenmpt.h"
          PATH_SUFFIXES libopenmpt)
find_library(OPENMPT_LIBRARY NAMES openmpt)

if(OPENMPT_INCLUDE_DIR AND OPENMPT_LIBRARY)
    if(APPLE)
        find_library(OPENMPT_DYNAMIC_LIBRARY NAMES "openmpt"  PATH_SUFFIXES ".dylib")
    elseif(WIN32)
        find_library(OPENMPT_DYNAMIC_LIBRARY NAMES "openmpt" PATH_SUFFIXES ".dll")
    else()
        find_library(OPENMPT_DYNAMIC_LIBRARY NAMES "openmpt" PATH_SUFFIXES ".so")
    endif()
endif()

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set OPENMPT_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(OPENMPT  DEFAULT_MSG
                                  OPENMPT_LIBRARY OPENMPT_INCLUDE_DIR)

mark_as_advanced(OPENMPT_INCLUDE_DIR OPENMPT_LIBRARY)

set(OPENMPT_LIBRARIES ${OPENMPT_LIBRARY} )
set(OPENMPT_INCLUDE_DIRS ${OPENMPT_INCLUDE_DIR} )

