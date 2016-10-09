Resque.redis = '192.168.100.12:6379'
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
