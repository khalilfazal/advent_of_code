autoload :Boolean, 'helpers/boolean'

# add method to dynamically create a module
class Object
  # @param name String
  #
  # @return Module
  def define_module(name, &block)
    const_set name, Module.new(&block)
  end

  # Continuously calls block until f(seed) is true
  # returns seed
  #
  # @param f Proc: Object -> Boolean
  # @block
  #
  # @return Object
  def loop_until(f, &block)
    seed = nil

    loop do
      break if f.call((seed = block.call))
    end

    seed
  end
end