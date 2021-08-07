class AddArtistToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :artist, :string
  end
end
