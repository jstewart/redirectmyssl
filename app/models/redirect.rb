class Redirect < ApplicationRecord
  validates_presence_of :destination

  belongs_to :account
  has_many :hosts
end
