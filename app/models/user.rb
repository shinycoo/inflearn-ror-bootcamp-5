class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  rolify
  include Authority::UserAbilities
  
  has_many :posts
  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  ## add 15
  after_create :set_default_role
  
  private 
  
  def set_default_role
    add_role :user 
  end
  
end
