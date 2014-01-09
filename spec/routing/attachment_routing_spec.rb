require 'spec_helper'

describe AttachmentsController do
  describe 'routing' do
    it 'POST /attachments' do
      expect(post '/attachments').to route_to('attachments#create')
    end
  end
end
