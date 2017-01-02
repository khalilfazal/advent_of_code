require 'helpers/element'

class Key < Element

end

class Value < Element

end

class Hash
  # update value at key with updater
  # if key doesn't exist, create with creator before using updater
  #
  # @param key Key
  # @param updater Proc: Value -> Value
  # @block creator
  #
  # @return Value
  def update!(key, updater, &creator)
    if has_key? key
      updater.call self[key]
    else
      self[key] = updater.call creator.call
    end
  end
end