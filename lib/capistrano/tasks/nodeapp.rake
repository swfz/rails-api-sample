namespace :deploy do

  before :starting, :add_nodeapp_hooks do
    after 'deploy:finished',             'nodeapp:install_node_module'
    after 'nodeapp:install_node_module', 'nodeapp:restart'
  end
end

namespace :nodeapp do
  task :install_node_module do
    on roles(:nodeapp) do
      # within release_path do
      within release_path do
        execute "pwd"
        execute "cd #{release_path} && npm --prefix ./slackbot install ./slackbot"
      end
    end
  end

  task :restart do
    on roles(:nodeapp) do
      within release_path do
        execute "sudo supervisorctl restart botkit || true"
      end
    end
  end
end

