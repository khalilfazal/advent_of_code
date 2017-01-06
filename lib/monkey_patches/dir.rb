# Adding methods to +Dir+
class Dir
  # @return String
  def self.cwd
    File.basename pwd
  end
end