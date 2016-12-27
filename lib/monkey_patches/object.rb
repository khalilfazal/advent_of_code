class Object
  # @param name String
  #
  # @return Module
  def define_module(name, &block)
    const_set name, Module.new(&block)
  end
end