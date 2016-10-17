namespace :deploy do
  desc 'add resque hook'
  before :starting, :add_resque_hooks do
    after 'deploy:finished', 'resque:restart'
  end
end

namespace :resque do
  desc 'restart resque'
  task :restart do
    on roles(:resque), :in => :sequence, :wait => 5 do |server|
      within current_path do
        with :rails_root => '/var/www/sample/current' do
          execute :rbenv, 'exec', 'bundle', 'exec', 'god stop', '|| true'
          execute :rbenv, 'exec', 'bundle', 'exec', 'god terminate', '|| true'

        end
        with :rails_root => '/var/www/sample/current', :processes => server.properties.processes, :queue => server.properties.queue do
          execute :rbenv, 'exec', 'bundle', 'exec', 'god -c config/resque.god'
        end
      end
    end
  end
end

