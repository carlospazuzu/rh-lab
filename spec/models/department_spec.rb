# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Department do
  describe 'Associations' do
    it { is_expected.to belong_to(:manager) }
    it { is_expected.to have_many :employments }
    it { is_expected.to have_many(:employees).through(:employments) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
