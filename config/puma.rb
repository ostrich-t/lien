root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"
pidfile "#{root}/tmp/pid"
state_path "#{root}/tmp/state"
activate_control_app
