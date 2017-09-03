class SavesController < ApplicationController

  include SavesHelper
  
  before_filter :authenticate_user!, except: [:save_money]
  
  def save_money
    @html = show_best_stores
  end
  
end
