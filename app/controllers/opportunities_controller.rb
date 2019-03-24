class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.by_state_forest(params[:state_forest_id])
  end
end
