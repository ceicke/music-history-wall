class Album < ApplicationRecord
  has_many :titles, dependent: :destroy
  accepts_nested_attributes_for :titles, allow_destroy: true

  validates :title, presence: true

end
