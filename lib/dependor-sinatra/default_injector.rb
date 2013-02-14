module Dependor
  module Sinatra
    class DefaultInjector
      include Dependor::AutoInject
      include Dependor::Sinatra::Objects

      def initialize(objects)
        sinatra_objects(objects)
      end
    end
  end
end
