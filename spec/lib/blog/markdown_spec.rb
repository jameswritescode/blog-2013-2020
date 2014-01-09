require 'spec_helper'

describe Blog::Markdown do
  describe 'custom markdown helpers' do
    it 'wraps image with link' do
      expect(Blog::Markdown.new('@[test](test.jpg)').render).to eql "<p><a href=\"test.jpg\"><img src=\"test.jpg\" alt=\"test\" /></a></p>\n"
    end
  end
end
