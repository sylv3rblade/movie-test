# frozen_string_literal: true

class MovieSerializer < BaseSerializer
  def data
    if single
      attributes.merge(ratings: object.ratings)
    else
      attributes
    end
  end
end
