class AddDefaultToSonosSystem < ActiveRecord::Migration[6.1]
  def change
    add_column :sonos_systems, :default, :boolean
  end
end
