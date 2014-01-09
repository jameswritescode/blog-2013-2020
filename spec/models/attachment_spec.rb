require 'spec_helper'

describe Attachment do
  it 'creates an attachment' do
    attachment = create(:attachment)

    expect(File.exist?(attachment.attachment.file.file)).to be_true
  end
end
