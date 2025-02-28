# lib/socket_server.rb
require 'socket'

# {
  # tag_code: 11111,
  # client_location: "kitchen"
# }

class SocketServer
  def initialize(port)
    @port = port
    @server = TCPServer.new(@port)
    @running = false
  end

  def start
    @running = true
    puts "Socket server started on port #{@port}"
    while @running
      Thread.start(@server.accept) do |client|
        handle_client(client)
      end
    end
  rescue Interrupt
    puts "Shutting down socket server..."
  ensure
    @server.close if @server
  end

  def stop
    @running = false
  end

  private


  # TODO: FIX
  # rails_1  | Error handling client: Broken pipe
  # rails_1  | Client connection closed
  def handle_client(client)
    begin
      puts "Client connected: #{client.peeraddr.inspect}"
      loop do
        data = client.recv(2048) # Receive up to 2048 bytes
        MusicRequest.new(data)
        
        client.puts "processing request" # Send a response back to the client
      end
    rescue EOFError
      # puts "Client disconnected abruptly"
    rescue => e
      # puts "Error handling client: #{e.message}"
    ensure
      client.close
      # puts "Client connection closed"
    end
  end
end
