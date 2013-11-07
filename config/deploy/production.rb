set :stage,     :production
set :branch,    :production
set :rails_env, :production

server "app@movie-club.yarotsky.me", roles: %w(app db web), primary: true

