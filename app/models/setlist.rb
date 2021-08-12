class Setlist < ApplicationRecord
  # optional: true付与でrollback解決
  belongs_to :user, optional: true
  has_many :songs, inverse_of: :setlist
  has_many :encores, inverse_of: :setlist
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :encores, reject_if: :all_blank, allow_destroy: true

  # ================ 検索機能 ================ 
  def self.search(search, word)
    if search == "perfect_match"
      @setlist = Setlist.where("artist LIKE? OR event LIKE? OR venue LIKE?", "#{word}", "#{word}", "#{word}")
    elsif search == "forward_match"
      @setlist = Setlist.where("artist LIKE? OR event LIKE? OR venue LIKE?", "#{word}%", "#{word}%", "#{word}%")
    elsif search == "backward_match"
      @setlist = Setlist.where("artist LIKE? OR event LIKE? OR venue LIKE?", "%#{word}", "%#{word}", "%#{word}")
    elsif search == "partial_march"
      @setlist = Setlist.where("artist LIKE? OR event LIKE? OR venue LIKE?", "%#{word}%", "%#{word}%", "%#{word}%")
    else
      @setlist = Setlist.all
    end
  end
  # ================ 検索機能 ================ 
end
