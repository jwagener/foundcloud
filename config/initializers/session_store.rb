# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_foundcloud_session',
  :secret      => '450b27e01a49a6a39ff6a9f1e217d14669f2da1e0794a8d58296379a2dbb86e2bebe4d29326a017864b69312a86b43f42b582194a57878d9c544d2ebb1f98266'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
