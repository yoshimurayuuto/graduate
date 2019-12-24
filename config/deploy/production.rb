server '54.250.56.234', user: 'app', roles: %w{app db web}
set :ssh_options, keys: "Users/yoshimurayuuto/.ssh/id_rsa"