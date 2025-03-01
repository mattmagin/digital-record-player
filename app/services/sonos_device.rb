# is this a service?? 
class SonosDevice
    def initialize(device_name)
        @device_name = device_name
    end
    
    # TODO: update so it can play / pause
    def playpause
        send_command("playpause")
    end

    def next_track
        send_command("next")
    end

    def previous_track
        send_command("previous")
    end

    def increaseVolume
        send_command("groupVolume/+5")
    end

    def decreaseVolume
        send_command("groupVolume/-5")
    end

    def play_request(request_url)
        send_command(request_url)
    end

    private
    
    # Can you memoise here??? is that needed
    def send_command(action)
        # ADD FARADAY HERE RATHER THAN RETURN
        # TODO: handle response
        puts "#{base_url()}#{action}"
        response = Faraday.get("#{base_url()}#{action}")
    end

    def base_url
        # TODO: add default port
        # localhost may not work on the server?
        "http://localhost:#{ENV["COMMUNICATION_PORT"]}/#{@device_name}/"
    end
end