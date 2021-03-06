#!/bin/sh

# arm_exidx_test.sh -- a test case for .ARM.exidx section.

# Copyright 2011 Free Software Foundation, Inc.
# Written by Doug Kwan <dougkwan@google.com>.

# This file is part of gold.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
# MA 02110-1301, USA.

# This file goes with arm_exidx_test.s, an ARM assembly source file constructed
# to test handling of .ARM.exidx and .ARM.extab sections.

check()
{
    if ! grep -q "$2" "$1"
    then
	echo "Did not find section header in $1:"
	echo "   $2"
	echo ""
	echo "Actual headers below:"
	cat "$1"
	exit 1
    fi
}

# Check that SHF_LINK_ORDER is set.
check arm_exidx_test.stdout ".* .ARM.exidx .* ARM_EXIDX .* AL .*"
check arm_exidx_test.stdout ".* .ARM.extab .* PROGBITS .* A .*"

exit 0
