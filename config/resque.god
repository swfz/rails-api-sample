God.watch do |w|
  w.name = "resque-1"
  w.group = 'resque'
  w.interval = 30.seconds
  w.env = {'QUEUE' => '*' }
  w.start = "bundle exec rake environment resque:work"
  w.log     = "log/resque.log"
  w.err_log = "log/resque.log"
end
