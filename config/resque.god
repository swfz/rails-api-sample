rails_root = ENV['RAILS_ROOT'] || '/var/www/sample/current'
God.pid_file_directory = "#{rails_root}/tmp/pids"

God.watch do |w|
  w.dir = rails_root
  w.name = "resque-1"
  w.group = 'resque'
  w.interval = 30.seconds
  w.env = {'QUEUE' => '*', 'RAILS_ENV' => 'development' }
  w.start = "rbenv exec bundle exec rake environment resque:work"
  w.stop_signal = 'QUIT'
  w.log     = "log/resque.log"
  w.err_log = "log/resque.log"

  # determine the state on startup
  w.transition(:init, { true => :up, false => :start }) do |on|
    on.condition(:process_running) do |c|
      c.running = true
    end
  end

  # determine when process has finished starting
  w.transition([:start, :restart], :up) do |on|
    on.condition(:process_running) do |c|
      c.running = true
    end

    # failsafe
    on.condition(:tries) do |c|
      c.times = 5
      c.transition = :start
    end
  end

  # start if process is not running
  w.transition(:up, :start) do |on|
    on.condition(:process_exits)
  end
end
