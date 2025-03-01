require 'json'

class MusicRequest
    def initialize(data)
        return if data.nil?
        
        processedData = make_processable data

        @tag_code = processedData["tag_code"]
        @player_name = processedData["client_location"]

        process()
    end

    def process
        begin
            spotify_record = get_tag.get_linked_spotify_record()
            
            request_url = spotify_record.request_url()

            device = SonosDevice.new(@player_name)
            device.play_request(request_url)
        rescue => e
            puts e
        end
        # http://localhost:5005/Kitchen1/spotify/now/spotify:track:4LI1ykYGFCcXPWkrpcU7hn
    end

    private

    # Right place for this?
    def get_tag
        PhysicalTag.find_by(tag_code: @tag_code)
    end

    def make_processable(data)
        begin
            JSON.parse(data)
            # TODO: check the keys and ensure they are good
        rescue => e
            puts e
        end
    end
end