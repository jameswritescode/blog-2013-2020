class AddPublishedAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime

    Post.where(published: true).each do |post|
      post.published_at = post.updated_at
      post.save
    end
  end
end
