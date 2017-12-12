# config valid only for current version of Capistrano
lock '3.3.5'


set :application, 'girlsbaito'
set :repo_url, 'https://github.com/y-takami/girlsbaito.git'
set :branch, 'master' #マージ前なら他のブランチでも設定可能
set :deploy_to, '/home/ec2-user/girlsbaito'
set :keep_releases, 5 #何個アプリを確保しておくか。この場合はデプロイした最新のアプリ5個をキープ
set :rbenv_type, :user
set :rbenv_ruby, '2.1.3'     #rubyのバージョン間違えないように!
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets bundle}


after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:legacy_restart'
  end
end