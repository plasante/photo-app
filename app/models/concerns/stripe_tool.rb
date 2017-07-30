module StripeTool
  
  def self.create_customer(email, stripeToken)
    Stripe::Customer.create(
      email: email,
      source: stripeToken
    )
  end

  def self.create_charge(customer_id, amount, description)
    Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: description,
      currency: 'usd'
    )
  end
end