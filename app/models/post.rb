class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  has_attached_file :picture, styles: { medium: '300x300>' }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/


  # has_many  :tags
end
