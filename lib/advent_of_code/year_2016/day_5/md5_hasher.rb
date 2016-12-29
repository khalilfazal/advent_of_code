require 'digest/md5'

class MD5Hasher
  private_class_method :new

  class << self
    def crack(id)
      hasher = new(id)

      (1 .. 8).map do
        hasher.next_interesting[5]
      end.join
    end

    def crack2(id)
      password = Array.new 8, nil
      hasher = new(id)

      while password.include? nil do
        hash = hasher.next_interesting
        pos = hash[5]
        pos_i = pos.to_i

        if ('0' .. '7').include?(pos) && password[pos_i].nil?
          password[pos.to_i] = hash[6]
        end
      end

      password.join
    end
  end

  def initialize(id)
    @id = id
    @i = 0
  end

  def next_interesting
    begin
      hash = Digest::MD5.hexdigest("#{@id}#{@i += 1}")
    end until /^0{5}/ =~ hash

    hash
  end
end