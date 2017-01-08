# +Key+ type of a Hash
class Key < Object
end

# +Value+ type of a Hash
class Value < Object
end

# Monkey patch Hash
class Hash
  # Update value at key with +updater+
  # If key doesn't exist, create with +creator+ before using +updater+
  #
  # @param key Key
  # @param updater Proc: Value -> Value
  # @block creator Proc: () -> Entity
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