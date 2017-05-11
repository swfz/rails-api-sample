require 'erb'
config = YAML.load(ERB.new(File.read(Rails.root.join('config','resque.yml'))).result)
Resque.redis = "#{config[Rails.env]['host']}:#{config[Rails.env]['port']}"
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
