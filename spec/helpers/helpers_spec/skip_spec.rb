require 'helpers/be_skipping'
require 'helpers/skip'
require 'rspec/matchers'

describe Skip do
  let(:expect_skippable) { expect { skip_this_when_file_not_found(enabled: false) { open '/foo/bar' } } }

  context StandardError do
    it { expect_skippable.to be_skipping_with StandardError }
    it { expect_skippable.to be_skipping }
  end
end