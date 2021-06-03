module ReviewsHelper
    def display_header(review)
        if params[:anime_id]
            content_tag(:h1, "Add a Review for #{review.anime.name} -  #{review.anime.category.name}")
        else
          content_tag(:h1, "Create a Review")
        end
      end
end
