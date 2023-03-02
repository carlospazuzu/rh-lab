# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Position do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
