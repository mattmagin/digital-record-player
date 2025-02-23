# config/initializers/socket_server.rb
require 'socket_server'

Rails.application.config.after_initialize do
  Thread.new do
    start_communication_server
  end
end

def start_communication_server
  socket_server = SocketServer.new(3001) # Choose a port
  socket_server.start
end
