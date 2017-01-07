require 'monkey_patches/string'

# Decompresses compressed
module Decompressor
  module_function

  # Partially decompresses the +compressed+
  # by checking for only one layer of compression
  #
  # @param compressed String
  #
  # @return String
  def partially_decompress(compressed)
    # Keep regex bracketed because of Lint/AmbiguousRegexpLiteral
    if (parsed = compressed.match(/(.*?)\((\d+)x(\d+)\)(.*)/))
      safe, length, times, rest = parsed.captures
      length = length.to_i
      times = times.to_i

      left, right = rest.split_at length
      safe + left * times + partially_decompress(right)
    else
      compressed
    end
  end

  # Calculates the total length of the compressed when fully decompressed.
  #
  # @param compressed String
  #
  # @return Integer
  def full_decompressed_length(compressed)
    total_length = 0
    min_length = compressed.length
    weights = [1] * min_length
    i = 0

    while i < min_length
      if compressed[i] === '('
        length, times = compressed.slice(i .. -1).match(/\((\d+)x(\d+)\)/).captures
        marker_end = i + 3 + length.length + times.length
        length = length.to_i
        times = times.to_i

        (marker_end ... marker_end + length).each do |j|
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