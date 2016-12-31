require 'monkey_patches/string'

module Day9
  class File
    extend Forwardable

    def_delegator :@decompressed, :length, :length

    def initialize(contents)
      @contents = contents
    end

    def decompress
      @decompressed = ''

      if (parsed = @contents.match(/(.*?)\((\d+)x(\d+)\)(.*)/))
        safe, length, times, rest = parsed.captures
        length = length.to_i
        times = times.to_i

        @decompressed += safe
        left, right = rest.splitAt length
        @decompressed += left * times
        @contents = right

        @decompressed += decompress
      else
        @decompressed += @contents
      end

      @decompressed
    end

    def reset
      @contents, @decompressed = @decompressed, @contents
      self
    end

    def decompressAll
      begin
        contents = @contents
        decompress
        decompressed = @decompressed
        reset
      end until contents === decompressed
    end
  end
end