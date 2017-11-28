class Api::V1::AnswersController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
	end

	def new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	private
		def question_params
		params.require(:answer)
	end
end
