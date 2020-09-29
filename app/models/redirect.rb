class Redirect < ApplicationRecord
  validates_presence_of :to, :from
  belongs_to :account
end
