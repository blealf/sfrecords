# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
# Rails.application.config.assets.precompile =  ['*.js', '*.css', '*.scss','*.css.erb'] 
# Rails.application.config.assets.precompile += %w( *.css )
# Rails.application.config.assets.precompile += %w( *.scss )
# Rails.application.config.assets.precompile += %w( *.js )
Rails.application.config.assets.precompile += %w( basic_header.css )
Rails.application.config.assets.precompile += %w( foot.css )
Rails.application.config.assets.precompile += %w( footer_white.css )
Rails.application.config.assets.precompile += %w( footer_with_logo.css )
Rails.application.config.assets.precompile += %w( header_icons.css )
Rails.application.config.assets.precompile += %w( scaffolds.css )
Rails.application.config.assets.precompile += %w( user_items.css )
Rails.application.config.assets.precompile += %w( npm.js )
Rails.application.config.assets.precompile += %w( user_items.js )
Rails.application.config.assets.precompile += %w( cable.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( income.js )