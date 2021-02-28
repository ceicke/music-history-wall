class RemoveSpotifyUrlFromAlbum < ActiveRecord::Migration[6.1]
  def change
    remove_column :albums, :spotify_url
  end
end
