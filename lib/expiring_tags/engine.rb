require 'rails/engine'

class ExpiringTags::Engine < Rails::Engine
  engine_name :expiring_tags

  # Allow the migrations to be run in the main app
  # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
  initializer :append_migrations do |app|
    unless app.root.to_s.match root.to_s
      config.paths["db/migrate"].expanded.each do |expanded_path|
        app.config.paths["db/migrate"] << expanded_path
      end
    end
  end

  ActiveSupport.on_load :active_record do
    # this is run when Rails loads ActiveRecord, and is within the context of ActiveRecord::Base.
    include ExpiringTags::ActiveRecord
  end
end
# require 'expiring_tags/engine'
#
# module ExpiringTags
#   class Engine < ::Rails::Engine
#     isolate_namespace ExpiringTags
#
#     # Allow the migrations to be run in the main app
#     # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
#     initializer :append_migrations do |app|
#       unless app.root.to_s.match root.to_s
#         config.paths["db/migrate"].expanded.each do |expanded_path|
#           app.config.paths["db/migrate"] << expanded_path
#         end
#       end
#     end
#
#     ActiveSupport.on_load :active_record do
#       # this is run when Rails loads ActiveRecord, and is within the context of ActiveRecord::Base.
#       include ExpiringTags::ActiveRecord
#     end
#   end
# end