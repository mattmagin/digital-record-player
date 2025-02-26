class SpotifyRecordsController < ApplicationController
    def index
        @spotify_records = SpotifyRecord.all
    end

    def create
        @spotify_record = SpotifyRecord.new(uri: params[:uri], record_type: params[:record_type])

        if @spotify_record.save
            redirect_to spotify_records_path
        else
            @errors = @spotify_record.errors.full_messages
            puts @errors    
        end
    end
end
