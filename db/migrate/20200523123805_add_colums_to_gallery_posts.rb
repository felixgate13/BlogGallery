class AddColumsToGalleryPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :gallery_posts, :from_left, :string
    add_column :gallery_posts, :height, :string
  end
end
