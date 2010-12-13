# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shanti_kmaps_session',
  :secret      => 'af03f737d4ab2dc6040e2cba93e8080336deb9692823e545a7b84a4478704390cf21f4b43050ca6e49ae247e092de0b5e61c67b988409fa37d7e29df0b68731b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
