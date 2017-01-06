autoload :ChronicDuration, 'chronic_duration'

# added methods to format duration
class Float
  # Shows the duration in human readable format
  #
  # @return String
  def duration
    ChronicDuration.output self
  end

  def format(format)
    (format % self).to_f
  end
end