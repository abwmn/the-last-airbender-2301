class SearchController < ApplicationController
  def index
    @nation = Nation.new
  end

  private
  
  def nation_params
    
  end
end