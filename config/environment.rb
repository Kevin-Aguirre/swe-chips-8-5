require 'action_dispatch/middleware/static'
module ActionDispatch
  class Static
    alias old_initialize initialize
    def initialize(app, path, index = 'index', *_args)
      old_initialize(app, path, index)
    end
  end
end

# Load the rails application
require File.expand_path('application', __dir__)

# Initialize the rails application
Rottenpotatoes::Application.initialize!
