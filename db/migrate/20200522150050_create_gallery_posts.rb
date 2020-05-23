class CreateGalleryPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :gallery_posts do |t|
      t.string :name
      t.integer :sequence
      t.string :float

      t.timestamps
    end
  end
end
