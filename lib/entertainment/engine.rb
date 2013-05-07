# We have to explicitly require resources in our Engine to prevent the using Rails App from having to some how require them itself
# http://stackoverflow.com/questions/6511859/rails3-engine-gems-paperclip-and-inherited-resources-not-loaded
require 'pyr_core/engine_base'
require 'pyr_core/engine'

module Entertainment
  class Engine < ::Rails::Engine
    include PyrCore::EngineBase


   initializer "pyr_core.custom_assets_precompile", :group => :all do |app|
      app.config.assets.precompile << "module.js"
   end

  end
end