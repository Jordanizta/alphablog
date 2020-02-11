module ArticlesHelper
  def adm_article_buttons(article, user)
    if logged_in? && current_user == article.user
      concat link_to("Editar esse artigo", edit_article_path(article), class: "btn btn-xs btn-primary")
      concat link_to("Deletar esse artigo", article_path(article), method: :delete,
        data: {confirm: "Certeza que deseja deletar?"}, 
        class: "btn btn-xs btn-danger")
    end
  end
end
