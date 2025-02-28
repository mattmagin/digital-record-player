class PhysicalTag < ApplicationRecord
  belongs_to :spotify_record

  validates :tag_code, presence: true
  validates :identifier, presence: true

  def get_linked_spotify_record
    spotify_record
  end
end
