class Setlist < ApplicationRecord
  has_many :songs, inverse_of: :setlist
  has_many :encores, inverse_of: :setlist
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :encores, reject_if: :all_blank, allow_destroy: true
end
