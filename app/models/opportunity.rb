class Opportunity < ApplicationRecord
  belongs_to :district
  belongs_to :state_forest
  has_many :opportunity_types
  has_many :types, through: :opportunity_types

  validates :name,
    presence: true,
    uniqueness: true
end
