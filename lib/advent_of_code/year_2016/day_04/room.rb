autoload :Boolean, 'helpers/boolean'

require 'active_support/core_ext/hash/transform_values'
require 'monkey_patches/array'
require 'monkey_patches/enumerable'
require 'monkey_patches/string'

# Decrypts room name
class Room
  attr_reader :id
  attr_reader :checksum

  NAME_ID_REGEX =/([-a-z]+)-(\d+)/

  class << self
    # Constructs a list of rooms,
    # selects the real rooms,
    # and sums their ids.
    #
    # @param inputs [String]
    #
    # @return Integer
    def sum_of_real_sector_ids(inputs)
      make_inputs(inputs).find_all(&:real?).map(&:id).sum
    end

    # Called either by Room#decrypt or in the spec
    #
    # Example:
    #
    # Room.decrypt ['qzmt-zixmtkozy-ivhz-343']
    #   # => 'very encrypted name'
    #
    # Room.decrypt ['aczupnetwp-mfyyj-opalcexpye', 977]
    #   # => 'projectile bunny department'
    #
    # @param params [String | Integer]
    #
    # @return String
    def decrypt(*params)
      if params.length.eql? 1
        encrypted, id = params[0].match(NAME_ID_REGEX).captures
        id = id.to_i
      else
        encrypted, id = params
      end

      abc = ('a' .. 'z').to_a
      encrypted.tr abc.join + '-', abc.rotate(id % 26).join + ' '
    end

    # Constructs a list of +Room+ names from the list of +inputs+,
    # finds the room who's decrypted name matches +name+
    # returns the +room+'s +id+
    #
    # @param inputs [String]
    # @param name String
    #
    # @return Integer
    def find_sector_id_of(inputs, name)
      make_inputs(inputs).find do |room|
        room.decrypt.eql? name
      end.id
    end

    private

    # Constructs a list of +Room+ names from the list of +inputs+
    #
    # @param inputs [String]
    #
    # @return [Room]
    def make_inputs(inputs)
      inputs.map(&method(:new))
    end
  end

  # Creates a +Room+ name from the +input+
  #
  # Example:
  #
  #   Room.new 'aaaaa-bbb-z-y-x-123[abxyz]'
  #   # => Room(@encrypted_name = 'aaaaa-bbb-z-y-x', @id = 123, @checksum = 'abxyz')
  #
  # @param input String
  def initialize(input)
    @encrypted_name, id, @checksum = input.match(/#{NAME_ID_REGEX}\[([a-z]+)\]/).captures
    @id = id.to_i
  end

  # Calculates the checksum by finding the top 5 most common characters
  #
  # @return String
  def calc_checksum
    @encrypted_name.chars.delete_elem('-').group_eq.transform_values(&:length).sort_by do |_, v|
      -v
    end.group_by(&:second).map do |_, v|
      v.sort
    end.sum.map(&:first).take(5).join
  end

  # @return Boolean
  def real?
    @checksum.eql? calc_checksum
  end

  # Decrypts the +Room+ name
  #
  # @return String
  def decrypt
    self.class.decrypt(@encrypted_name, @id)
  end
end