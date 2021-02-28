class Title < ApplicationRecord
  has_one_attached :audio_data, dependent: :purge
  belongs_to :album

  validates :title, presence: true
end
