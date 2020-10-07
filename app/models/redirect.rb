class Redirect < ApplicationRecord
  validates :destination, presence: true, url: true

  belongs_to :account
  has_many :hosts, dependent: :destroy

  accepts_nested_attributes_for :hosts,
                                reject_if: :all_blank,
                                allow_destroy: true
end
