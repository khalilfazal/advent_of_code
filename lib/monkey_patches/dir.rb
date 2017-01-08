# Adding methods to +Dir+
class Dir
  # Gets the current working directory
  #
  # @return String
  def self.cwd
    File.basename pwd
  end
end