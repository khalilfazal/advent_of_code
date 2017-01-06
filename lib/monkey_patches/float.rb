autoload :ChronicDuration, 'chronic_duration'

class Float
  def duration
    ChronicDuration.output self
  end

  def format(format)
    (sprintf format, self).to_f
  end
end