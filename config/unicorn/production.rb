# -*- encoding : utf-8 -*-
worker_processes 2
rails_env = ENV['RAILS_ENV'] || 'production'
working_directory "/home/uni/app/uni/#{rails_env}/current/"
preload_app false
#timeout 30
p "######### RAILS_ENV #{rails_env}"
#listen "/home/tasks/app/casino/#{rails_env}/current/tmp/sockets/unicorn.sock"
if rails_env == 'production'
  listen 80, :tcp_nopush => true
end

pid "/home/uni/app/uni/#{rails_env}/current/tmp/pids/unicorn.pid"

stderr_path "/home/uni/app/uni/#{rails_env}/current/log/unicorn.#{rails_env}-error.log"
stdout_path "/home/uni/app/uni/#{rails_env}/current/log/unicorn.#{rails_env}.log"

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "/home/uni/app/uni/#{rails_env}/current/tmp/unicorn.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # the following is *required* for Rails + "preload_app true",
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  # if preload_app is true, then you may also want to check and
  # restart any other shared sockets/descriptors such as Memcached,
  # and Redis.  TokyoCabinet file handles are safe to reuse
  # between any number of forked children (assuming your kernel
  # correctly implements pread()/pwrite() system calls)
end
