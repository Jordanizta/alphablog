module ArticlesHelper
  def adm_article_buttons(article, user)
    if logged_in? && current_user == user
        concat link_to("Editar esse artigo", edit_article_path(article), class: "btn btn-xs btn-primary")
        concat link_to("Deletar esse artigo", article_path(article), method: :delete, class: "btn btn-xs btn-danger",        
                data: {confirm: "Certeza que deseja deletar?"})
    end
  end

end
