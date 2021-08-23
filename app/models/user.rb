class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)が、
  # フォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
  def followed_by?(user)
    reverse_of_relationships.find_by(follower_id: user.id).present?
  end

  # DM機能
  has_many :direct_messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :schedules, dependent: :destroy
  
  has_many :setlists

  # ================ 検索機能 ================
  def self.search(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE? OR artist LIKE? OR introduction LIKE?", "#{word}", "#{word}", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE? OR artist LIKE? OR introduction LIKE?", "#{word}%", "#{word}%", "#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE? OR artist LIKE? OR introduction LIKE?", "%#{word}", "%#{word}", "%#{word}")
    elsif search == "partial_march"
      @user = User.where("name LIKE? OR artist LIKE? OR introduction LIKE?", "%#{word}%", "%#{word}%", "%#{word}%")
    else
      @user = User.all
    end
  end
  # ================ 検索機能 ================

  # userのis_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  validates :name, length: {maximum: 10, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 100}
end
