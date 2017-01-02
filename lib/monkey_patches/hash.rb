require 'helpers/element'

class Key < Element
end

class Value < Element
end

# update value at key with updater
# if key doesn't exist, create with creator before using updater
class Hash
  # @param key Key
  # @param updater Proc: Value -> Value
  # @block creator
  #
  # @return Value
  def update!(key, updater, &creator)
    if key? key
      updater.call self[key]
    else
      self[key] = updater.call creator.call
    end
  end
end