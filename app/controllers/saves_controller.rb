class SavesController < ApplicationController

  include SavesHelper
  
  def saves
    @html = show_best_store
  end
  
end
