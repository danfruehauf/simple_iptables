#
# Cookbook Name:: simple_iptables
# Attributes:: default
#
# Copyright 2014, Dan Fruehauf
#
# This file is part of simple_iptables.
#
# simple_iptables is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# simple_iptables is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with simple_iptables.  If not, see <http://www.gnu.org/licenses/>.
#

# Entries for simple iptables - see README.md for examples
default['simple_iptables']['entries']   = []

# Maximum rules allowed
default['simple_iptables']['max_rules'] = 1024
