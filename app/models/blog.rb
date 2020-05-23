class Blog < ApplicationRecord
    belongs_to :category
    has_one_attached :main_photo
end
