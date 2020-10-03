class Host < ApplicationRecord
  belongs_to :redirect

  validates_presence_of :redirect_id
  validates :hostname,
            presence: true,
            uniqueness: true,
            url: true
end
