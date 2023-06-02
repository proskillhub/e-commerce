class Customer::CheckoutsController < ApplicationController
    Stripe.api_key = ENV["STRIPE_SECREATE_KEY"]
    @@url = "http://localhost:3000/customer/checkouts"
    def  index
        session = Stripe::Checkout::Session.create({
            mode: 'payment',
            # Remove the payment_method_types parameter
            # to manage payment methods in the Dashboard
            payment_method_types: ['card'],
            metadata: {order_id:2},
            line_items: [{
              price_data: {
              # The currency parameter determines which
              # payment methods are used in the Checkout Session.
                currency: 'eur',
                  product_data: {
                    name: 'T-shirt',
                  },
                  unit_amount: 2000,
                },
                quantity: 1,
              }],
              success_url: 'http://localhost:3000/customer/checkouts/order_place',
              cancel_url: 'https://example.com/cancel',
            })
            # Stripe::Checkout::Session.retrieve(params[:session_id])
            redirect_to session.url,allow_other_host: true
    end
    def orderplace
      flash[:notice]="order placed"
    end
end
