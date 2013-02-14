module Dependor
  module Sinatra
    module BlockWrapper
      def self.wrap(block)
        proc do
          dependency_names = block.parameters.map(&:last)
          dependencies = dependency_names.map{|name| injector.__send__(name)}
          instance_exec(*dependencies, &block)
        end
      end
    end
  end
end
