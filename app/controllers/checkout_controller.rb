class CheckoutController < ApplicationController
  def create
    instrument = Instrument.find(params[:instrument_id])

    if instrument.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           [
        name:        instrument.name,
        description: instrument.name,
        amount:      instrument.price * 100.to_i, # price * 100.to_i
        currency:    "cad",
        quantity:    1
      ]
    )

    redirect_to @session.url, allow_other_host: true
    # respond_to do |format|
    #   format.js # app/views/checkout/create.js.erb
    # end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel; end
end
