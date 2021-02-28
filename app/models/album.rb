class Album < ApplicationRecord
  has_many :titles, dependent: :destroy
  accepts_nested_attributes_for :titles, allow_destroy: true

  validates :title, presence: true

  def sonos_play
    s = SonosSystem.last
    s.setup
    s.stop
    s.clear_queue

    titles.each do |title|
      title_url = Rails.application.routes.url_helpers.url_for title.audio_data
      s.add_to_queue(title_url)
    end

    s.play
  end

end
