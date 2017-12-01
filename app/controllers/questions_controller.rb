class QuestionsController < ApplicationController
	before_action :authenticate_user!
	respond_to :json
	#before_action :authenticate_user!
	#skip_before_filter :verify_authenticity_token

	def index
		#if current_user.role == true
		p current_user
			@user_count = User.count
			@question_count = Question.count
			@answer_count = Answer.count
			
		#questions = Question.order("created_at DESC");

		#render json: questions.as_json(only: [:id,:title,:user_id,:created_at, :user_count, :question_count,:answer_count])
	#else	
		#questions = Question.order("created_at DESC");
		#render json: questions.as_json(only: [:id,:title,:user_id,:created_at])
	end

	def admin_question
		p params
		
	end

	def new
		@question = current_user.questions.build
	end

	def create
		@question = current_user.questions.build(question_params)
		@question.user_id = current_user.id
		if @question.save
			respond_to do |format|
			format.html {redirect_to :controller => "answers", :action => "new"}
		end
		else
			render json: {errors: @question.errors}, status: 422
		end
	end

	def show
		respond_with Question.find(params[:id])
	end

	def edit
	end

	def update
		question = Question.find(params[:id])
		if question.update(question_params)
			render json: {status: 'success', message: "Question updated", data: question }, status: :ok
		else
			render json: {errors: question.errors}, status: 422
		end
	end

	private
		def question_params
		params.require(:question).permit(:title, :user_id, :alpha_num, :status)
	end
end
