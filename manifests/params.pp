class redis::params {
  $port  = 6379
  $bind  = '127.0.0.1'

  $user  = 'redis'
  $group = 'redis'

  case $::operatingsystem {
    /(Ubuntu|Debian)/ : {
      $package_name    = 'redis-server'
      $service_name    = 'redis-server'
      $confdir         = '/etc/redis'
      $config_file     = '/etc/redis/redis.conf'
      $config_template = 'etc/redis/redis.conf.erb'
      $datadir         = '/var/lib/redis'
      $logdir          = '/var/log/redis'
    }
    default           : {
      fail("The ${module_name} module is not supported on ${::operatingsystem}")
    }
  }
}
