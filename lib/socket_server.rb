# lib/socket_server.rb
require 'socket'

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

  def handle_client(client)
    begin
      puts "Client connected: #{client.peeraddr.inspect}"
      loop do
        data = client.recv(1024) # Receive up to 1024 bytes
        break if data.empty?

        puts "Received: #{data.inspect}"

        # Process the data (e.g., parse a command, update a database)
        response = process_data(data)

        client.puts response # Send a response back to the client
      end
    rescue EOFError
      puts "Client disconnected abruptly"
    rescue => e
      puts "Error handling client: #{e.message}"
    ensure
      client.close
      puts "Client connection closed"
    end
  end

  def process_data(data)
    # Replace this with your actual data processing logic
    "Echo: #{data}"
  end
end
