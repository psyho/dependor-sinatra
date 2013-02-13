module Dependor
  module Sinatra
    module Objects
      attr_reader :params, :env, :request, :response, :session

      def sinatra_objects(objects)
        @params = objects.params
        @env = objects.env
        @request = objects.request
        @response = objects.response
        @session = objects.session
      end
    end
  end
end
