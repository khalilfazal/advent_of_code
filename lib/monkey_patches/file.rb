# Adding methods to +File+
class File
  # Gets the name of the program from its file name
  #
  # @return String
  def self.script_name
    basename $PROGRAM_NAME, '.*'
  end
end