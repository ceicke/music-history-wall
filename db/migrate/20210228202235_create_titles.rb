class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.integer :album_id
      t.string :title
      t.string :filename

      t.timestamps
    end
  end
end
