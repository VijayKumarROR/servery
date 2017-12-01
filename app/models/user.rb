class User < ActiveRecord::Base
require 'securerandom'

	before_create :generate_alpha_numeric
	has_many :questions
	has_many :answers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def generate_alpha_numeric
  	self.alpha_num = SecureRandom.urlsafe_base64(9)
  end
 
 enum role: [:user, :admin]
end
