class Opportunity < ApplicationRecord
  belongs_to :district
  belongs_to :state_forest
  has_many :opportunity_types
  has_many :types, through: :opportunity_types

  validates :name,
    presence: true,
    uniqueness: true

  scope :by_state_forest, ->(state_forest_ids) {
    unless state_forest_ids.nil?
      where(state_forest_id: state_forest_ids)
    end
  }
end
