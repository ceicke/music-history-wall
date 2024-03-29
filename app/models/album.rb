class Album < ApplicationRecord
  has_many :titles, dependent: :destroy
  accepts_nested_attributes_for :titles, allow_destroy: true

  validates :title, presence: true

  def get_artwork
    auth_wrapper = Discogs::Wrapper.new("music-history-wall", user_token: Rails.application.credentials[:discogs_token])

    search = Rails.cache.fetch("#{cache_key_with_version}/discogs_search_result", expires_in: 30.days) do
      begin
        auth_wrapper.search(title)
      rescue Exception => e
        logger.error e
      end
    end

    begin
      if search.results.length > 0
        return search.results.try(:first).try(:cover_image)
      else
        return "https://via.placeholder.com/300.jpg"
      end
    rescue Exception => e
      logger.error e
      return "https://via.placeholder.com/300.jpg"
    end
  end

end
