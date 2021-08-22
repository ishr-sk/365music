class Contact < ApplicationRecord
  validates :name, presence: true
  validates :tel, presence: true
  validates :email, presence: true
  validates :message, presence: true
end
