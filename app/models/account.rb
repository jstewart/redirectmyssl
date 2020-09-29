class Account < ApplicationRecord
  validates_presence_of :email, :name

  has_many :redirects
end
