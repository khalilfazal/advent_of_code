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

  # @param input String
  def initialize(input)
    @encrypted_name, id, @checksum = input.match(/#{NAME_ID_REGEX}\[([a-z]+)\]/).captures
    @id = id.to_i
  end

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
    unless @checksum.encoding.eql? calc_checksum.encoding
      p @checksum.encoding
      p calc_checksum
    end

    @checksum.eql? calc_checksum
  end

  # @return String
  def decrypt
    self.class.decrypt(@encrypted_name, @id)
  end
end