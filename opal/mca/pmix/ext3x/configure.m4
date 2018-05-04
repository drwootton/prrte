# -*- shell-script -*-
#
# Copyright (c) 2004-2005 The Trustees of Indiana University and Indiana
#                         University Research and Technology
#                         Corporation.  All rights reserved.
# Copyright (c) 2004-2005 The University of Tennessee and The University
#                         of Tennessee Research Foundation.  All rights
#                         reserved.
# Copyright (c) 2004-2005 High Performance Computing Center Stuttgart,
#                         University of Stuttgart.  All rights reserved.
# Copyright (c) 2004-2005 The Regents of the University of California.
#                         All rights reserved.
# Copyright (c) 2011-2013 Los Alamos National Security, LLC.
#                         All rights reserved.
# Copyright (c) 2010-2015 Cisco Systems, Inc.  All rights reserved.
# Copyright (c) 2013-2018 Intel, Inc. All rights reserved.
# Copyright (c) 2015-2017 Research Organization for Information Science
#                         and Technology (RIST). All rights reserved.
# Copyright (c) 2014-2015 Mellanox Technologies, Inc.
#                         All rights reserved.
# $COPYRIGHT$
#
# Additional copyrights may follow
#
# $HEADER$
#

# MCA_pmix_ext3x_CONFIG([action-if-found], [action-if-not-found])
# -----------------------------------------------------------
AC_DEFUN([MCA_opal_pmix_ext3x_CONFIG],[
    AC_CONFIG_FILES([opal/mca/pmix/ext3x/Makefile])

    AS_IF([test "$opal_external_pmix_happy" = "yes"],
          [ # check for the 3.x version
           AC_MSG_CHECKING([if external component is version 3.x])
           AS_IF([test "$opal_external_pmix_version" = "3x"],
                 [AC_MSG_RESULT([yes])
                  opal_pmix_external_3x_happy=yes],
                 [AC_MSG_RESULT([no])
                  opal_pmix_external_3x_happy=no])

           AS_IF([test "$opal_pmix_external_3x_happy" = "yes"],
                 [$1]
                 [$2])],
          [$2])

    opal_pmix_ext3x_CPPFLAGS=$opal_external_pmix_CPPFLAGS
    opal_pmix_ext3x_LDFLAGS=$opal_external_pmix_LDFLAGS
    opal_pmix_ext3x_LIBS=$opal_external_pmix_LIBS

    AC_SUBST([opal_pmix_ext3x_CPPFLAGS])
    AC_SUBST([opal_pmix_ext3x_LDFLAGS])
    AC_SUBST([opal_pmix_ext3x_LIBS])

])dnl
