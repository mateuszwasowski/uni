# Change these
set :application,     'uni'
set :scm, :git
set :repo_url, 'git@github.com:mateuszwasowski/uni.git'
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :branch, "master"

# trzeba recznie stowrzyc gemset rvm use ... --create

#set :format, :pretty
set :log_level, :debug
set :pty, true

#set :bundle_gemfile, "sats/Gemfile"

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :keep_releases, 5

#after 'deploy:restart', 'unicorn:restart'   # app preloaded
set :deploy_to, "/home/uni/app/uni/#{fetch(:rails_env)}/"
set :unicorn_conf, "#{fetch(:deploy_to)}/current/config/unicorn/production.rb" # #{fetch(:rails_env)}.rb"
set :unicorn_pid, "#{fetch(:deploy_to)}/shared/pids/unicorn.pid"

#RAILS_ENV=production bundle exec unicorn -c config/unicorn/production.rb -D -E production
after :deploy, 'deploy:restart'

namespace :logs do
  desc "tail rails logs"
  task :tail_rails do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
    end
  end
end

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "/etc/init.d/unicorn-ubi-#{fetch(:rails_env)} restart"
    end
  end

  after :finishing, 'deploy:cleanup'

end
