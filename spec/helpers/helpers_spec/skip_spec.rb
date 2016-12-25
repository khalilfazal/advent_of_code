require 'helpers/be_skipping'
require 'helpers/skip'
require 'rspec/matchers'

describe Skip do
  context StandardError do
    subject { skip_this_when_file_not_found(enabled: false) { open '/foo/bar' }}

    it { is_expected.to be_skipping }
    it { is_expected.to be_skipping_with }
    it { is_expected.to be_skipping_with(subject.class) }
  end

  context Errno::ENOENT do
    it { expect { skip_this_when_file_not_found(enabled: false) { open '/foo/bar' } }.to be_skipping }
    it { expect { skip_this_when_file_not_found(enabled: false) { open '/foo/bar' } }.to be_skipping_with(subject.class) }
  end
end