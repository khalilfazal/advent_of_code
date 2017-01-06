# Adding methods to +File+
class File
  # @return String
  def self.script_name
    basename $PROGRAM_NAME, '.*'
  end
end