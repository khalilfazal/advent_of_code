require 'digest/md5'

include Digest

# finds interesting md5 hashes
class MD5Hasher
  private_class_method :new

  class << self
    # @param id String
    #
    # @return String
    def crack(id)
      hasher = new(id)

      (1 .. 8).map do
        hasher.next_interesting[5]
      end.join
    end

    # @param id String
    #
    # @return String
    def crack2(id)
      password = Array.new 8, nil
      hasher = new(id)

      while password.include? nil
        hash = hasher.next_interesting
        pos = hash[5]
        pos_i = pos.to_i

        if password[pos_i].nil? && ('0' .. '7').include?(pos)
          password[pos.to_i] = hash[6]
        end
      end

      password.join
    end
  end

  # @param id String
  def initialize(id)
    @id = id
    @i = 0
    @hasher = MD5.method :hexdigest
  end

  # @return String
  def next_interesting
    hash = nil

    loop do
      hash = @hasher.call("#{@id}#{@i += 1}")
      break if /^0{5}/ =~ hash
    end

    hash
  end
end
