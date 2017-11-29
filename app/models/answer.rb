class Answer < ActiveRecord::Base
require 'securerandom'
before_create :generate_alpha_numeric

  belongs_to :question
  belongs_to :user

    def generate_alpha_numeric
  		self.alpha_num = SecureRandom.urlsafe_base64(9)
  	end

end
