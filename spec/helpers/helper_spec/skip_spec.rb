require 'helpers/be_skipping'
require 'helpers/skip'
require 'rspec/matchers'

describe Skip do
  context StandardError do
    it { expect { skip_this_when_file_not_found(enabled: false) { open '' } }.to be_skipping }
    it { expect { skip_this_when_file_not_found(enabled: false) { open '' } }.to be_skipping_with }
    it { expect { skip_this_when_file_not_found(enabled: false) { open '' } }.to be_skipping_with(subject.class) }
  end

  context Errno::ENOENT do
    it { expect { skip_this_when_file_not_found(enabled: false) { open 'x' } }.to be_skipping_with(subject.class) }
  end
end