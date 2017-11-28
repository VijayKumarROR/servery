class User < ActiveRecord::Base
require 'securerandom'

	before_create :generate_alpha_numeric
	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def generate_alpha_numeric
  	self.alpha_num = SecureRandom.urlsafe_base64(9)
  end

end
