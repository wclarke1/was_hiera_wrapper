# Class: was_hiera_wrapper
# ===========================
#
# Full description of class was_hiera_wrapper here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'was_hiera_wrapper':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class was_hiera_wrapper {

  class { '::hiera':
    hierarchy       => [
      'host/%{::domain}/%{::hostname}',
      'role/common/%{system_role}',
      'role/%{::system_role}/%{::system_env}',
      'domain/%{::domain}',
      'global/global',
    ],
    datadir         => '/etc/puppet/data/master',
    backends        => ['yaml', 'puppet'],
    eyaml           => true,
    eyaml_extension => 'yaml',
    extra_config    => ':puppet::datasource: params',
    merge_behavior  => 'deeper',
  }

}
