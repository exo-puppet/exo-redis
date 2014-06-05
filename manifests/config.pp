class redis::config inherits redis::params {
  # Create redis data directory
  file { $redis::data_dir:
    ensure => directory,
    owner  => $redis::params::user,
    group  => $redis::params::group,
    mode   => 755
  } ->
  # Manage redis configuration
  file { 'redis.conf':
    ensure  => present,
    path    => $redis::params::config_file,
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template("redis/${redis::params::config_template}"),
    require => Class['redis::install'],
    notify  => [Class['redis::service']],
  }

}
