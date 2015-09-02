# == Class: varnish::params
#

class varnish::params {

  # set Varnish conf location based on OS
  case $::operatingsystem {
    'RedHat', 'CentOS': {
      if $::operatingsystemmajrelease >= 7 {
        $conf_file_path = '/etc/varnish/varnish.params'
      } else {
        $conf_file_path = '/etc/default/varnish'
      }
    }
    'OracleLinux': {
      $conf_file_path = '/etc/sysconfig/varnish'
    }
    default: {
      $conf_file_path = '/etc/default/varnish'
    }
  }

  $version = $varnish::version ? {
    /4\..*/ => 4,
    default => $varnish::default_version,
  }
}
