environment 'production'
app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"
pidfile "#{app_root}/tmp/pid"
state_path "#{app_root}/tmp/state"
activate_control_app
