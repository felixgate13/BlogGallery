class AddFromTopToGalleryPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :gallery_posts, :from_top, :string
  end
end
