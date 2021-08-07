class CreatePostHashtagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_hashtag_relations do |t|
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end