class RenameSongIdColumnToEncores < ActiveRecord::Migration[5.2]
  def change
    rename_column :encores, :song_id, :setlist_id
  end
end
