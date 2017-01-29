log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               '/home/hieu/samedi/samedi/.chef/admin.pem'
validation_client_name   'sameri-validator'
validation_key           '/home/hieu/samedi/samedi/-chef/sameri-validator.pem'
chef_server_url          'https://chefmaster/organizations/samedi'
syntax_check_cache_path  '/home/hieu/samedi/samedi/.chef/syntaxcache'
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:editor]="/usr/bin/vim"


