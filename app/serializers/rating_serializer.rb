# frozen_string_literal: true

class RatingSerializer < BaseSerializer
  def data
    if single
      attributes.merge(movie: object.movie, user: object.user)
    else
      attributes
    end
  end
end
