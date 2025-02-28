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
            player = SonosDevice.new(@player_name)
            request = SpotifyRequest.new(spotify_record.uri, spotify_record.record_type).get_share_link()
            
            player.queue_request(request)
            player.play()
        rescue => e
            puts e
        end
        
    end

    private

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