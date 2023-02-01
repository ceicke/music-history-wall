class RemoveIpFromSonosSystems < ActiveRecord::Migration[6.1]
  def change
    remove_column :sonos_systems, :ip
  end
end
