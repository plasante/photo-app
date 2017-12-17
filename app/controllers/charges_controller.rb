class ChargesController < ApplicationController
  
  before_action :check_if_subscribed, only: [:new, :create]
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

    # Setting current_user.subscribed to true
    current_user.subscribed = true
    current_user.save
    
    redirect_to thanks_path
    
    # Catches any error
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
    
    private
    
      def set_amount_to_be_charged
        @amount = 100
      end
      
      def set_description
        @description = "Grocery Shopping List Subscription"
      end
      
      #
      #TODO: Uncomment this
      #
      def check_if_subscribed
        if current_user.subscribed
          #flash[:warning] = "Thanks but you have already subscribed!"
          #redirect_to root_path
        end
      end
end
