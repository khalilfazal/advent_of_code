module Skip
  def skip_this_on_network_error
    skip 'skipped due to network issues' if @input.nil?
    yield
  end
end

RSpec.configure do |c|
  c.include Skip
end