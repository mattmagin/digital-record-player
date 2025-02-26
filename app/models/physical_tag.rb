class PhysicalTag < ApplicationRecord
  belongs_to :spotify_record

  validates :tag_code, presence: true
  validates :identifier, presence: true
end
