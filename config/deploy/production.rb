server '18.178.31.249', user: 'app', roles: %w{app db web}
set :ssh_options, keys: "Users/yoshimurayuuto/.ssh/id_rsa"
