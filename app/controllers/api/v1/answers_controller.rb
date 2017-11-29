class Api::V1::AnswersController < ApplicationController
	skip_before_filter :verify_authenticity_token
	respond_to :json
	#before_action :authenticate_user!

	def index
		questions = Answer.order("created_at DESC");
		render json: {status: "Success", message: "List of all answer", answer_data: questions}, status: :ok
	end

	def new
		answer = Answer.new(answer_params)
	end

	def create
		#answer = Answer.new(answer_params)
		#@question = Question.find(params[:question_id])
    	@answer = @question.answers.new(answer_params)
		@answer.user_id = current_user.id
		if answer.save
			render json: {status: 'success', message: "Answer saved", data: @answer}, status: :ok
		else
			render json: {errors: @answer.errors}, status: 422
		end
	end

	def show
		respond_with Answer.find(params[:id])
	end

	def edit
	end

	def update
		answer = Answer.find(params[:id])
		if answer.update(answer_params)
			render json: {status: 'success', message: "Answer updated", data: answer}, status: 200
		else
			render json: {errors: answer.errors}, status: 422
		end
	end

	def destroy

	end

	private
		def answer_params
			params.require(:answer).permit(:description, :alpha_num, :question_id, :user_id)
		end

		def find_question
			@question = Question.find(params[:question_id])
		end
end
