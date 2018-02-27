require 'rails_helper'

RSpec.describe Rating, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_numericality_of(:score) }
    it { is_expected.to validate_inclusion_of(:score).in_range(0..10) }
  end
end
