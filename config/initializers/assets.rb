# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( capital_increases.js )
Rails.application.config.assets.precompile += %w( capital_increases.css )
Rails.application.config.assets.precompile += %w( companies.js )
Rails.application.config.assets.precompile += %w( companies.css )
Rails.application.config.assets.precompile += %w( identities.js )
Rails.application.config.assets.precompile += %w( identities.css )
Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( main.css )
Rails.application.config.assets.precompile += %w( stockholders.js )
Rails.application.config.assets.precompile += %w( stockholders.css )
Rails.application.config.assets.precompile += %w( transactions.js )
Rails.application.config.assets.precompile += %w( transactions.css )