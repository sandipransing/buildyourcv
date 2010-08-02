# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_buildyourcv_session',
  :secret      => '07f67c321733ffae6bf3d8ba317e245a52940e063e48aeeec07f0efdddc1b5514aee26af6c6725659c2609896e82e27d0c5cfa82779d0ddbf107ba501d72c476'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
