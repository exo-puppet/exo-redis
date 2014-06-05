################################################################################
#
# This module manages the Redis Server installation.
#
# == Parameters
#
# [+ensure+]
#   (OPTIONAL) (default: running)
#
#   TODO
#
# [+port+]
#   (OPTIONAL) (default: $redis::params::port)
#
#   TODO
#
# [+bind+]
#   (OPTIONAL) (default: $redis::params::bind)
#
#   TODO
#
# [+data_dir+]
#   (OPTIONAL) (default: $redis::params::datadir )
#
#   Directory where to store the data (redis data backup files)
#
# [+max_clients+]
#   (OPTIONAL) (default: 0 which mean unlimited )
#
#   Set the max number of connected clients at the same time. By default there
#   is no limit, and it's up to the number of file descriptors the Redis process
#   is able to open. The special value '0' means no limits.
#   Once the limit is reached Redis will close all the new connections sending
#   an error 'max number of clients reached'.
#
# [+max_memory+]
#   (OPTIONAL) (default: 0 which mean unlimited in the puppet module )
#
#   The amount of memory the redis server is able to allocate
#   Don't use more memory than the specified amount of bytes.
#   When the memory limit is reached Redis will try to remove keys with an
#   EXPIRE set. It will try to start freeing keys that are going to expire
#   in little time and preserve keys with a longer time to live.
#   Redis will also try to remove objects from free lists if possible.
#
#   Note on units: when memory size is needed, it is possible to specifiy
#   it in the usual form of 1k 5GB 4M and so forth:
#
#   1k  => 1000 bytes
#   1kb => 1024 bytes
#   1m  => 1000000 bytes
#   1mb => 1024*1024 bytes
#   1g  => 1000000000 bytes
#   1gb => 1024*1024*1024 bytes
#
#   units are case insensitive so 1GB 1Gb 1gB are all the same.
#
# [+max_memory_policy+]
#   (OPTIONAL) (default: volatile-lru )
#
#   MAXMEMORY POLICY: how Redis will select what to remove when maxmemory
#   is reached? You can select among five behavior:
#
#   volatile-lru -> remove the key with an expire set using an LRU algorithm
#   allkeys-lru -> remove any key accordingly to the LRU algorithm
#   volatile-random -> remove a random key with an expire set
#   allkeys->random -> remove a random key, any key
#   volatile-ttl -> remove the key with the nearest expire time (minor TTL)
#   noeviction -> don't expire at all, just return an error on write operations
################################################################################
class redis (
  $ensure            = 'running',
  $port              = $redis::params::port,
  $bind              = $redis::params::bind,
  $data_dir          = $redis::params::datadir,
  $max_clients       = '0',
  $max_memory        = '0',
  $max_memory_policy = 'volatile-lru') inherits redis::params {
  include repo
  include redis::install, redis::config, redis::service

}
