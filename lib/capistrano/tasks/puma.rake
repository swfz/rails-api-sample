namespace :deploy do
  desc "echo hostname"
  task :echo_hostname do
    on roles(:puma), :in => :sequence, :wait => 3 do |server|
      uptime = capture(:uptime)
      puts "#{host.hostname} reports: #{uptime}"
    end
  end

  after 'deploy:updated', 'puma:restart'
end

namespace :puma do
  desc "restart puma"
  task :restart do
    on roles(:puma) do
      within current_path do
        if capture(:rbenv, 'exec', 'bundle', 'exec', 'pumactl', '-F config/puma.rb', 'status', '|| true') =~ /started/
          execute :rbenv, 'exec', 'bundle', 'exec', 'pumactl', '-F config/puma.rb', 'phased-restart'
        else
          execute :rbenv, 'exec', 'bundle', 'exec', 'puma', '-C config/puma.rb'
        end
      end
    end
  end

  desc "start puma"
  task :start do
    on roles(:puma) do
      within current_path do
        execute :bundle, 'exec', 'puma', '-C config/puma.rb'
      end
    end
  end

  desc "stop puma"
  task :stop do
    on roles(:puma) do
      within current_path do
        execute :bundle, 'exec', 'pumactl', '-F config/puma.rb', 'stop'
      end
    end
  end
end
