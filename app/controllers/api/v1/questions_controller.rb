module Api::V1
	class QuestionsController < ApplicationController
	before_action :authenticate_user!
	skip_before_filter :verify_authenticity_token

	def index
		#@questions = Question.all
	end

	def new
		@question = current_user.questions.build(question_params)
		if @question.save
		end
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
		#params.require(:question)
	end
end
end
