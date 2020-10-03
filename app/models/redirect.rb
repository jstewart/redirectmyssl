class Redirect < ApplicationRecord
  validates :destination, presence: true, url: true

  belongs_to :account
  has_many :hosts
end
