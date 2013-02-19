module Dependor
  module Sinatra
    module WithoutDependor
      def disable_dependor
        @dependor_disabled = true
      end

      def enable_dependor
        @dependor_disabled = false
      end

      def dependor_disabled?
        @dependor_disabled
      end

      def without_dependor(&block)
        disable_dependor
        block.call
        enable_dependor
      end
    end
  end
end
