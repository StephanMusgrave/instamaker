class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  has_attached_file :picture, 
    styles: { medium: '300x300>' },
    storage: :s3,
    s3_host_name: 's3-us-west-2.amazonaws.com',
    s3_credentials: {
      bucket: 'instamaker',
      access_key_id: Rails.application.secrets.s3_access_key,
      secret_access_key: Rails.application.secrets.s3_secret_key
     }
    validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/


  # has_many  :tags
end
