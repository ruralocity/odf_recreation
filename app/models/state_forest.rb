class StateForest < ApplicationRecord
  validates :name,
    presence: true,
    uniqueness: true
end
