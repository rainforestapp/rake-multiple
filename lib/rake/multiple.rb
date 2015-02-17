require "rake/multiple/version"

module Rake
  module Multiple
    require 'rake/multiple/railtie' if defined?(Rails)
  end
end
