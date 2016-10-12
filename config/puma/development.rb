# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.

threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

application_path = "#{File.expand_path("../../..", __FILE__)}"

#bind "unix://#{directory}/tmp/sockets/puma.sock"
environment "development"

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

daemonize false

state_path "#{application_path}/tmp/pids/puma.state"
pidfile "#{application_path}/tmp/pids/puma.pid"

stdout_redirect "#{application_path}/log/puma.stdout.log", "#{application_path}/log/puma.stderr.log"

# The code in the `on_worker_boot` will be called if you are using
# clustered mode by specifying a number of `workers`. After each worker
# process is booted this block will be run, if you are using `preload_app!`
# option you will want to use this block to reconnect to any threads
# or connections that may have been created at application boot, Ruby
# cannot share connections between processes.
#
# on_worker_boot do
#   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
# end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
