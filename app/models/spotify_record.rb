class SpotifyRecord < ApplicationRecord
    has_many :physical_tags, dependent: :destroy

    validates :uri, presence: true
    validates :record_type, presence: true
end
