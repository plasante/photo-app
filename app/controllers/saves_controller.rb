class SavesController < ApplicationController

  include SavesHelper
  
  before_filter :authenticate_user!, except: [:saves]
  
  def saves
    @html = show_best_store
  end
  
end
