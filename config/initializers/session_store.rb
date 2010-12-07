# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shanti_kmaps_session',
  :secret      => '37fdbdfe69fad02774890ef03548e797693f63fa617efaafa79d41afeec318b749a52aec03772fd785617454cbead75d5f575df6f51fa527c0784aebcc9638c0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
