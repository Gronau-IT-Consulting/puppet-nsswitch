# This module creates a /etc/nsswitch.conf file whith all the lines that
# determine the sources from which to obtain name-service information in a range
# of categories, and in what order. For further information look into manual
# pages.
#
# @param aliases
#   Mail aliases, used by getaliasent() and related functions.
#
# @param automount
#   Which conventions to use for automounting of homes.
#1
# @param bootparams
#   Where bootparams shall be supplied from (e.g. for diskless clients at boot
#   time using rpc.bootparamd).
#
# @param ethers
#   Ethernet numbers.
#
# @param group
#   Groups of users, used by getgrent() and related functions.
#
# @param gshadow
#   Shadow groups, used by getspnam() and related functions.
#
# @param hosts
#   Host names and numbers, used by gethostbyname() and related functions.
#
# @param netgroup
#   Network-wide list of hosts and users, used for access rules.
#
# @param netmasks
#   Netmasks specify how much of the address to reserve for sub-dividing
#   networks into subnetworks.
#
# @param network
#   Network names and numbers, used by getnetent() and related functions.
#
# @param passwd
#   User passwords, used by getpwent() and related functions.
#
# @param protocols
#   Network protocols, used by getprotoent() and related functions.
#
# @param publickey
#   Public and secret keys for Secure_RPC used by NFS and NIS+.
#
# @param services
#   Remote procedure call names and numbers, used by getrpcbyname() and related
#   functions.
#
# @param services
#   Network services, used by getservent() and related functions.
#
# @param shadow
#   Shadow user passwords, used by getspnam() and related functions.
#
# @param sudoers
#   Sudoers policy module users.
#
# @example
#  include nsswitch
#
#  class { 'nsswitch':
#    passwd => ['ldap','files'],
#    hosts  => ['dns [!UNAVAIL=return]','files'],
#  }
#
# @author Thomas Linkin <tom@puppetlabs.com>
# @author Marcellus Siegburg <msiegbur@imn.htwk-leipzig.de>
#
# Copyright 2013 Thomas Linkin, Marcellus Siegburg
#
class nsswitch (
  Nsswitch::OptionalArrayString $aliases    = undef,
  Nsswitch::OptionalArrayString $automount  = undef,
  Nsswitch::OptionalArrayString $bootparams = undef,
  Nsswitch::OptionalArrayString $ethers     = undef,
  Nsswitch::OptionalArrayString $group      = undef,
  Nsswitch::OptionalArrayString $gshadow    = undef,
  Nsswitch::OptionalArrayString $hosts      = undef,
  Nsswitch::OptionalArrayString $netgroup   = undef,
  Nsswitch::OptionalArrayString $netmasks   = undef,
  Nsswitch::OptionalArrayString $networks   = undef,
  Nsswitch::OptionalArrayString $passwd     = undef,
  Nsswitch::OptionalArrayString $protocols  = undef,
  Nsswitch::OptionalArrayString $publickey  = undef,
  Nsswitch::OptionalArrayString $rpc        = undef,
  Nsswitch::OptionalArrayString $services   = undef,
  Nsswitch::OptionalArrayString $shadow     = undef,
  Nsswitch::OptionalArrayString $sudoers    = undef,
) {

  file { '/etc/nsswitch.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nsswitch/nsswitch.conf.erb'),
  }
}
