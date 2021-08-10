class Song < ApplicationRecord
  belongs_to :setlist
  has_many :encores, inverse_of: :song
  accepts_nested_attributes_for :encores, reject_if: :all_blank, allow_destroy: true
end