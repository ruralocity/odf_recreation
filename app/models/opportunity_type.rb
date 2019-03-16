class OpportunityType < ApplicationRecord
  belongs_to :opportunity
  belongs_to :type
end
