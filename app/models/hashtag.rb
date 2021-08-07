class Hashtag < ApplicationRecord
  has_many :post_hashtag_relations
  # has_many throughで多対多のリレーション
  has_many :posts, through: :post_hashtag_relations
  
end
