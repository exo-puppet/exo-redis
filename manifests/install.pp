class redis::install inherits redis::params {
  package { $redis::params::package_name: ensure => present, }
}
