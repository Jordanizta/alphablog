class ReactionsController < ApplicationController
	before_action :set_reaction

	def like
		if @reaction
			update_reaction(true) if !@reaction.like
		else
			create_reaction(true)
		end
		flash[:success] = 'Curtido'
		redirect_to article_path(params[:article_id])
	end

	def dislike
		if @reaction 
			!@reaction.like ? flash[:danger] = "Já era/é um deslike" : update_reaction(false)
		else
			@reaction = create_reaction(false)
			flash[:danger] = "Descurtido"
		end
		redirect_to article_path(params[:article_id])
	end

	private 
	def set_reaction
		@reaction = Reaction.find_by_article_id_and_user_id(
			params[:article_id],current_user.id
		)
	end

	def create_reaction(like)
		Reaction.new(
			article_id: params[:article_id], 
			user_id: current_user.id,
			like: like
		).save
	end

	def update_reaction(like)
		@reaction.update(like: like)
	end

end