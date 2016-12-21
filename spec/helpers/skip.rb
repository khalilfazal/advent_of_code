module Skip
  def skip_when_dced
    skip 'skipped due to network issues' if @input.nil?
    yield
  end
end

RSpec.configure do |c|
  c.include Skip
end