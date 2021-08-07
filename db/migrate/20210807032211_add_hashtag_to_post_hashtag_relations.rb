class AddHashtagToPostHashtagRelations < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_hashtag_relations, :hashtag, foreign_key: true
  end
end
