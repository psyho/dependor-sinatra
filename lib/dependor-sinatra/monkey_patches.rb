class Sinatra::Base
  def injector
    @injector ||= self.class.injector_creator.call(sinatra_objects)
  end

  def sinatra_objects
    Dependor::Sinatra::Objects.create(self)
  end

  class << self
    attr_accessor :injector_creator

    def injector(&block)
      self.injector_creator = block
    end

    alias :route_without_dependor :route
    def route(verb, path, options={}, &block)
      route_without_dependor(verb, path, options) do
        dependency_names = block.parameters.map(&:last)
        dependencies = dependency_names.map{|name| injector.__send__(name)}
        block.call(*dependencies)
      end
    end
  end
end
