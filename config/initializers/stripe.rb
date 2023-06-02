Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISH_KEY'],
    secret_key: ENV['STRIPE_SECREATE_KEY']
   }
Stripe.api_key = ENV["STRIPE_SECREATE_KEY"]