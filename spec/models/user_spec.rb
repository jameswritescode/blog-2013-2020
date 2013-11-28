require 'spec_helper'

describe User do
  context 'user creation' do
    let(:user) { create(:user) }

    it { expect(user).to be_valid }
  end
end
