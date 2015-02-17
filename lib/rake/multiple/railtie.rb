require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :rake_mulitple

    rake_tasks do
      load "rake/multiple/tasks/multiple.rake"
    end
  end
end
