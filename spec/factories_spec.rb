require 'spec_helper'

describe 'Factories' do
  FactoryGirl.factories.map(&:name).each do |factory_name|
    it "#{factory_name} factory should be valid" do
      build(factory_name).should be_valid
    end
  end
end
