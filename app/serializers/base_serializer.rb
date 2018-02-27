# frozen_string_literal: true

class BaseSerializer
  delegate :to_json, to: :data
  attr_accessor :object, :single

  def initialize(object, single = false)
    @object = object
    @single = single
  end

  def attributes
    object.attributes.reject { |k,v| attributes_to_skip.include? k }
  end

  def attributes_to_skip
    %w[created_at updated_at]
  end
end
