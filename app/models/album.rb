class Album < ApplicationRecord
  has_many :titles, dependent: :destroy
  accepts_nested_attributes_for :titles, allow_destroy: true

  validates :title, presence: true

  def get_artwork
    auth_wrapper = Discogs::Wrapper.new("music-history-wall", user_token: Rails.application.credentials[:discogs_token])
    search = auth_wrapper.search(title)

    if search.results.length > 0
      return auth_wrapper.search(title).results.first.cover_image
    else
      return "https://via.placeholder.com/400.jpg"
    end
  end

end
