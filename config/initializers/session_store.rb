# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_awdemo-bizapp_session',
  :secret      => 'b3df9b818d1952da8f9a84c05685af429f07401dedba2d635ffd63dc15da9a40fa74c4301644aaa01448fcd3e8eea8a3ffdb9bafaaa29d4543916b4b914438be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
