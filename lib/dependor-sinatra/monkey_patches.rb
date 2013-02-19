class Sinatra::Base
  include Dependor::Sinatra::HasInjector
  extend Dependor::Sinatra::Enabler
  extend Dependor::Sinatra::WithoutDependor
  enable_dependor_for_method :route
  enable_dependor_for_method :add_filter
  enable_dependor_for_method :condition
end

Sinatra::Delegator.delegate :injector
Sinatra::Delegator.delegate :without_dependor
