class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  # validates :description, presence: true, length: { minimum: 3 }
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
  belongs_to :user

  has_and_belongs_to_many  :tags
  has_many :likes

  def tag_names
    ''
  end

  def tag_names=(tag_names)
    return if tag_names.blank?

    tag_names.split(/,\s?/).uniq.each do |tag_name|
      formatted_name = '#' + tag_name.delete('#')
      
      tag = Tag.find_or_create_by(name: formatted_name)
      self.tags << tag
      end
  end

end








