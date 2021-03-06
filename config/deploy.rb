# Gemfile.lockを見てcapistranoのバージョンを入れる
lock '3.14.1'

# 自身のアプリ名、ユーザー名、リポジトリ名を記述
set :application, 'ge-app'
set :repo_url,  'git@github.com:Shuhei-Kubo/ge-app.git'
set :linked_files, fetch(:linked_files, []).push('config/local_env.yml')
# set :linked_files, %w{config/local_env.yml}
set :linked_files, fetch(:linked_files, []).push('config/google_cloud.json')
# set :linked_files, %w{config/google_cloud.json}
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'

# chat-spaceで使ったpemを指定
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/gunjin6221.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :linked_files, %w{ config/master.key }
set :linked_files, %w{ config/google_cloud.json }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    # invoke 'unicorn:stop'
    invoke 'unicorn:restart'
  end

  desc 'upload master.key'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/master.key', "#{shared_path}/config/master.key")
  end
end

  desc 'upload google_cloud.json'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/google_cloud.json',"#{shared_path}/config/google_cloud.json")
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end
