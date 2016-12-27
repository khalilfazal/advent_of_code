class String
  # @param separator String
  #
  # @return [String]
  def lines(separator = $/)
    split separator
  end
end