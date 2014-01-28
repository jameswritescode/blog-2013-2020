require 'spec_helper'

describe 'Dashboard Management' do
  before do
    4.times { create(:post) }

    login_as(:user)
  end

  it 'changes form values when another post is selected', js: true do
    find('div.posts button').click()
    find("div.posts li[data-slug='#{Post.last.slug}']").click()

    expect(find('input.title').value).to eql Post.last.title
    expect(find('textarea').value).to eql Post.last.content
  end
end
