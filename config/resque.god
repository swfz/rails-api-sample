rails_root = ENV['RAILS_ROOT'] || '/var/www/sample/current'
rails_env  = ENV['RAILS_ENV'] || 'development'
processes  = ENV['PROCESSES'] || 2
queue      = ENV['QUEUE'] || 'default'
God.pid_file_directory = "#{rails_root}/tmp/pids"

processes.times do |n|
  God.watch do |w|
    w.dir = rails_root
    w.name = "resque-#{n}"
    w.group = 'resque'
    w.interval = 30.seconds
    w.env = {'QUEUE' => queue, 'RAILS_ENV' => rails_env }
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
end
