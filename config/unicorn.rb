# -*- coding: utf-8 -*-
#

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

$app_dir = "/homeiot"
$sock_fname = File.expand_path 'tmp/sockets/unicorn.sock', $app_dir
$pid_fname = File.expand_path 'tmp/unicorn.pid', $app_dir
$log_fname = File.expand_path 'log/unicorn.log', $app_dir

listen $sock_fname
pid    $pid_fname

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead.'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT.'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

stderr_path $log_fname
stdout_path $log_fname
