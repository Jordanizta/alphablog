class ReactionsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		if already_reaction?
			flash[:danger]= "Você já curtiu!"
			redirect_to article_path(@article)
		else
			@article.reactions.create(user_id: current_user.id, article_id: @article.id)
			flash[:success] = "Curtido!"
			redirect_to article_path(@article)
		end
	end

	def already_reaction?
		Reaction.where(user_id: current_user.id, article_id: params[:article_id]).exists?
	end

end