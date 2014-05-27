class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  # has_many  :tags
end
