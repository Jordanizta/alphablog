class ReactionsController < ApplicationController
=begin
	before_action :article_find

	def create
		if already_reaction?
			flash[:danger]= "Você já curtiu!"
			redirect_to articles_path
		else
			params[:article_id].reactions.create(user_id: current_user.id, article_id: params[:article_id].id)
			flash[:success] = "Curtido!"
			redirect_to articles_path
		end
	end

	def already_reaction?
		Reaction.where(user_id: current_user.id, article_id: params[:article_id]).exists?
	end

	def article_find
		params[:article_id] = Article.find(params[:article_id])
	end

	def dislike
		if !(already_reaction?)
			flash[:danger] = "Não pode descurtir"
		else
			@update = params[:article_id].reactions.where(user: current_user)
			@update.toggle!(:mood)
			flash[:success] = "Descurtido"
		end
		redirect_to articles_path
	end
=end

	#BEGIN
	before_action :set_reaction

	def like
		if @reaction
			if @reaction.mood?
				flash[:danger] = "Você já curtiu"
				redirect_to article_path(params[:article_id])
			else
				@reaction.toggle!(:mood)
				flash[:success] = "Curtiu"
				redirect_to article_path(params[:article_id])
			end
		else
			@reaction = set_new_reaction
			@reaction.toggle(:mood)
			@reaction.save
			flash[:success] = "Curtiu"
			redirect_to article_path(params[:article_id])
		end
	end

	def dislike
		if @reaction 
			if @reaction.mood?
				@reaction.toggle!(:mood)
				flash[:danger] = "Deslike"
				redirect_to article_path(params[:article_id])
			else
				flash[:danger] = "Você já deu deslike"
				redirect_to article_path(params[:article_id])
			end
		else
			@reaction = set_new_reaction
			flash[:danger] = "Deslike"
			redirect_to article_path(params[:article_id])
		end
	end

	private 
	def set_reaction
		@reaction = Reaction.find_by_article_id_and_user_id(
			params[:article_id],current_user.id
		)
	end

	def set_new_reaction
		Reaction.new(
			article_id: params[:article_id], 
			user_id: current_user.id,
			mood: false
		)
	end
	# END
end