module Dependor
  module Sinatra
    module Enabler
      def enable_dependor(method)
        without_dependor = :"#{method}_without_dependor"

        # the only way to alias a private method
        instance_eval("alias #{without_dependor} #{method}")

        define_singleton_method(method) do |*args, &block|
          wrapped_block = Dependor::Sinatra::BlockWrapper.wrap(block)
          __send__(without_dependor, *args) do
            instance_eval(&wrapped_block)
          end
        end
      end
    end
  end
end
