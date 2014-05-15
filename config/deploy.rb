# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'rorla_api'
set :user, 'deployer'
set :repo_url, 'git@github.com:hschoidr/rorla_api.git'

set :stage, :production

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# set :branch, :cap3

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deployer/apps/rorla_api'
set :pty, true

set :default_env, {
  'PATH' => "~/.rbenv/shims:~/.rbenv/bin:$PATH"
}

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp}

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.1'
set :nc_terminal, 'com.googlecode.iterm2'

Dir.glob('config/deploy/recipes/*.rb').each { |recipe| load recipe }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  ask :db_user, 'deployer'

  ask :db_pass, '******'

  ask :db_admin_user, 'root'

  after :starting, 'db:mysql:setup'

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end


