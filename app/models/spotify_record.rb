class SpotifyRecord < ApplicationRecord
    validates :uri, presence: true
    validates :record_type, presence: true
end
