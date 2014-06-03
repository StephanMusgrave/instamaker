class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # SCM: removed :registerable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
end
