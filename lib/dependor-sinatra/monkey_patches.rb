class Sinatra::Base
  include Dependor::Sinatra::HasInjector
  extend Dependor::Sinatra::Enabler
  enable_dependor :route
  enable_dependor :add_filter
  enable_dependor :condition
end

Sinatra::Delegator.delegate :injector
