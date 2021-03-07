class AddPlayCountToAlbums < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :play_count, :integer, default: 0
  end
end
