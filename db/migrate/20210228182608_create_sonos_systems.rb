class CreateSonosSystems < ActiveRecord::Migration[6.1]
  def change
    create_table :sonos_systems do |t|
      t.string :name
      t.string :ip

      t.timestamps
    end
  end
end
