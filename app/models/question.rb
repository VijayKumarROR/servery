class Question < ActiveRecord::Base
require 'securerandom'
before_create :generate_alpha_numeric
enum status: [:Active, :Expire, :Pvt]

  belongs_to :user
  has_many :answers

  def generate_alpha_numeric
  		self.alpha_num = SecureRandom.urlsafe_base64(9)
  	end

end
