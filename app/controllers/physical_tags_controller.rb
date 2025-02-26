class PhysicalTagsController < ApplicationController
    def index
        @physical_tags = PhysicalTag.all
        @spotify_records = SpotifyRecord.all
    end
    
    def create
        @spotify_record = SpotifyRecord.find_by(uri: params[:spotify_record_uri])
        puts @spotify_record
        @physical_tag = PhysicalTag.new(physical_tag_params.merge(spotify_record_id: @spotify_record.id))


        if @physical_tag.save
            redirect_to physical_tags_path
        else
            @errors = @physical_tag.errors.full_messages
            puts @errors    
        end
    end

    private

    def physical_tag_params
        params.permit(:tag_code, :identifier)
    end
end
