IF(NOT CPACK_PACKAGE_VERSION_MAJOR)
  SET(CPACK_PACKAGE_VERSION_MAJOR "1")
ENDIF()

IF(NOT CPACK_PACKAGE_VERSION_MINOR)
  SET(CPACK_PACKAGE_VERSION_MINOR "1")
ENDIF()

IF(NOT CPACK_PACKAGE_VERSION_PATCH)
  SET(CPACK_PACKAGE_VERSION_PATCH "$ENV{BUILD_NUMBER}")
  IF(NOT CPACK_PACKAGE_VERSION_PATCH)
    SET(CPACK_PACKAGE_VERSION_PATCH 0)
  ENDIF()
ENDIF()

IF(NOT CPACK_PACKAGE_VENDOR)
  SET(CPACK_PACKAGE_VENDOR "iZENEsoft")
ENDIF()

SET(CPACK_SYSTEM_NAME "${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}")
IF (NOT CPACK_PACKAGE_NAME)
  STRING(TOLOWER "${CMAKE_PROJECT_NAME}" CPACK_PACKAGE_NAME)
ENDIF()

IF(NOT CPACK_PACKAGE_CONTACT)
  SET(CPACK_PACKAGE_CONTACT "support@izenesoft.com")
ENDIF()

IF(NOT CPACK_GENERATOR)
  SET(CPACK_GENERATOR TBZ2)
  FIND_PROGRAM(DPKG_CMD dpkg)
  IF(DPKG_CMD)
    LIST(APPEND CPACK_GENERATOR DEB)
  ENDIF()
  FIND_PROGRAM(RPMBUILD_EXECUTABLE rpmbuild)
  IF(RPMBUILD_EXECUTABLE)
    LIST(APPEND CPACK_GENERATOR RPM)
  ENDIF()
ENDIF()

IF(NOT CPACK_SOURCE_GENERATOR)
  SET(CPACK_SOURCE_GENERATOR "TBZ2")
ENDIF()

IF(NOT CPACK_SOURCE_IGNORE_FILES)
  SET(CPACK_SOURCE_IGNORE_FILES
    "/\\\\.git/;\\\\.gitignore$;\\\\.swp$;\\\\.#;/#;~$"
    )
ENDIF()

INCLUDE(CPack)