module Dependor
  module Sinatra
    module HasInjector
      def self.included(klass)
        klass.extend ClassMethods
      end

      def injector
        @injector ||= self.class.injector_creator.call(self)
      end

      module ClassMethods
        attr_writer :injector_creator

        def injector_creator
          @injector_creator ||= proc{ |objects| Dependor::Sinatra::DefaultInjector.new(objects) }
        end

        def injector(&block)
          self.injector_creator = block
        end
      end
    end
  end
end
