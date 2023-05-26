class SearchController < ApplicationController
  def index
    @nation = AvatarService.search(params[:nation])
  end

  private
  
  def nation_params
    
  end
end