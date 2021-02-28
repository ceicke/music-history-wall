class RemoveFilenameFromTitles < ActiveRecord::Migration[6.1]
  def change
    remove_column :titles, :filename
  end
end
