require 'spec_helper'

describe 'Logging in' do
  it 'logs in successfully' do
    login_as :user

    expect(current_path).to eql dashboard_path
  end

  it 'logs out successfully' do
    login_as :user

    expect(current_path).to eql dashboard_path

    find('div.menu button').click
    find('div.menu li.signout a').click

    expect(current_path).to eql root_path
  end
end
