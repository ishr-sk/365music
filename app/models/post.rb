class Post < ApplicationRecord
  belongs_to :user
  attachment :image

  has_many :post_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :post_hashtag_relations, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post.hashtags = []
    hashtags.uniq.map do |hashtag|
      # ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.hashtags.clear
    hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end

  # ================ 検索機能 ================
  def self.search(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE? OR artist LIKE? OR event LIKE? OR body LIKE?", "#{word}", "#{word}", "#{word}", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE? OR artist LIKE? OR event LIKE? OR body LIKE?", "#{word}%", "#{word}%", "#{word}%", "#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE? OR artist LIKE? OR event LIKE? OR body LIKE?", "%#{word}", "%#{word}", "%#{word}", "%#{word}")
    elsif search == "partial_march"
      @post = Post.where("title LIKE? OR artist LIKE? OR event LIKE? OR body LIKE?", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%")
    else
      @post = Post.all
    end
  end
  # ================ 検索機能 ================

  validates :title, length: {maximum: 50}
  validates :body, length: {maximum: 200}
  validates :user_id, presence: true
end
