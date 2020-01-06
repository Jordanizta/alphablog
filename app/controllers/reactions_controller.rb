class ReactionsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@article.reactions.create(user_id: current_user.id, article_id: @article.id)
		redirect_to article_path(@article)
	end

	def dislike
	end

end