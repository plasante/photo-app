class ChargesController < ApplicationController
  
  before_action :set_amount_to_be_charged
  before_action :set_description
  
  def new
  end
  
  def thanks
  end

  def create
    
    # Creates a stripe customer
    customer = StripeTool.create_customer(params[:stripeEmail], params[:stripeToken])

    # Passing attributes to the Stripe's API
    charge = StripeTool.create_charge(customer.id, @amount, @description)

    redirect_to thanks_path
    
    # Catches any error
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
    
    private
    
      def set_amount_to_be_charged
        @amount = 700
      end
      
      def set_description
        @description = "Some amazing product"
      end
end
