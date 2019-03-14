class Opportunity < ApplicationRecord
  belongs_to :district
  belongs_to :state_forest

  validates :name,
    presence: true,
    uniqueness: true
end
