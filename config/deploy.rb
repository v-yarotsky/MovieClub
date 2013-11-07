set :application,   'MovieClub'
set :repo_url,      'git@github.com:v-yarotsky/MovieClub.git'
set :deploy_to,     '/var/www/movie_club'
set :linked_dirs,   %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_files,  %w{db/production.sqlite3}
set :ssh_options,   forward_agent: true

set :default_env,   -> { { path: "#{shared_path}/bin:/opt/ruby-2.0.0-p247/bin:$PATH" } }
set :keep_releases, 5

before 'deploy:migrate',   'deploy:backup_db'
after  'deploy:finishing', 'deploy:cleanup'

