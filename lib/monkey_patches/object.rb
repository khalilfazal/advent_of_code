require 'helpers/boolean'

# add method to dynamically create a module
class Object
  # @param name String
  #
  # @return Module
  def define_module(name, &block)
    const_set name, Module.new(&block)
  end

  # Continuously calls block until f(yield.call) is true
  # returns yield.call
  #
  # @param f Proc: Object -> Boolean
  # @block
  #
  # @return Object
  def loop_until(f)
    x = nil

    loop do
      break if f.call((x = yield))
    end

    x
  end
end