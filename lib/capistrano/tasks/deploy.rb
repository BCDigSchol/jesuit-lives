namespace :deploy do
  desc "Restart Rails Service"
  task :restart do
    on roles(:app) do
      execute "sudo /usr/bin/systemctl restart rails.service"
    end
  end
end
after "deploy:finishing", "deploy:restart"