class RemoveGuestFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :guest, :boolean
  end
end
