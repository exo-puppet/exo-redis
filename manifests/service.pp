class redis::service inherits redis::params {
  service { 'redis':
    ensure  => $redis::ensure,
    name    => $redis::params::service_name,
    require => [Class['redis::install', 'redis::config']],
  }
}
