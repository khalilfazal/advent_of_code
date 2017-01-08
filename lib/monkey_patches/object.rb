autoload :Boolean, 'helpers/boolean'

# Add method to dynamically create a module
class Object
  # Creates a module nested where ever this is called
  #
  # Example
  #
  #   module A
  #    define_module 'B' do
  #    end
  #   end
  #
  #   is equivalent to
  #
  #   module A
  #     module B
  #     end
  #   end
  #
  #
  # @param name String
  #
  # @return Module
  def define_module(name, &block)
    const_set name, Module.new(&block)
  end

  # Continuously calls block until +f+ +seed+ is +true+
  # returns +seed+ after being assign to block.call multiple times.
  #
  # Example
  #
  #   countdown = 10
  #
  #   loop_until(->(x) { x.eql? 0 }) do
  #     countdown -= 1
  #   end
  #
  #   # => 0
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