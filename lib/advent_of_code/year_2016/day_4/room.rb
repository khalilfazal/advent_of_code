require 'active_support/core_ext/hash/transform_values'
require 'helpers/boolean'
require 'monkey_patches/array'
require 'monkey_patches/enumerable'

class Room
  attr_reader :id
  attr_reader :checksum

  NAME_ID_REGEX =/([-a-z]+)-([0-9]+)/

  class << self
    def sum_of_real_sector_ids(inputs)
      make_inputs(inputs).select(&:real?).map(&:id).sum
    end

    def decrypt(*params)
      if params.length === 1
        encrypted, id = params[0].match(NAME_ID_REGEX).captures
        id = id.to_i
      else
        encrypted, id = params
      end

      abc = ('a' .. 'z').to_a
      encrypted.tr abc.join + '-', abc.rotate(id % 26).join + ' '
    end

    def find_sector_id_of(inputs, name)
      make_inputs(inputs).find do |room|
        room.decrypt === name
      end.id
    end

    private

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
    @checksum === calc_checksum
  end

  def decrypt
    self.class.decrypt(@encrypted_name, @id)
  end
end