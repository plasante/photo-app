class SavesController < ApplicationController

  include SavesHelper
  include ShowProductDetailsHelper
  
  before_filter :authenticate_user!, except: [:save_money, :show_details]
  
  def save_money
    @html = show_best_stores
  end
  
  def show_details
    @details = show_best_store_product_details( params[:store_id] )
  end
  
end
