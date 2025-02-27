class SpotifyRequest
    def initialize(uri, type)
        @uri = uri
        @type = type
    end


    def get_share_link
        "https://#{share_link_prefix()}/#{@type}/#{@uri}"
    end

    private

    def share_link_prefix
        "open.spotify.com"
    end
end