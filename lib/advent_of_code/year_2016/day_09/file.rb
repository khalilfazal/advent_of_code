autoload :Forwardable, 'forwardable'
require 'monkey_patches/string'

# Need to wrap class in a module to avoid collision with +File+
module Day9
  # Represents a compressed file
  class File
    extend Forwardable

    def_delegator :@decompressed, :length, :length

    class << self
      # @param contents String
      #
      # @return Integer
      def decompressed_length(contents)
        total_length = 0
        min_length = contents.length
        weights = [1] * min_length

        i = 0
        while i < min_length
          if contents[i] === '('
            length, times = contents.slice(i .. -1).match(/\((\d+)x(\d+)\)/).captures
            marker_end = i + 3 + length.length + times.length
            times = times.to_i

            (marker_end .. marker_end + length.to_i - 1).each do |j|
              weights[j] *= times
            end

            i = marker_end
          else
            total_length += weights[i]
            i += 1
          end
        end

        total_length
      end
    end

    # @param contents String
    def initialize(contents)
      @contents = contents
    end

    # @return String
    def decompress
      @decompressed = ''

      if (parsed = @contents.match(/(.*?)\((\d+)x(\d+)\)(.*)/))
        safe, length, times, rest = parsed.captures
        length = length.to_i
        times = times.to_i

        @decompressed += safe
        left, right = rest.split_at length
        @decompressed += left * times
        @contents = right

        @decompressed += decompress
      else
        @decompressed += @contents
      end

      @decompressed
    end
  end
end