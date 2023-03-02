# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee do
  describe 'Associations' do
    it { is_expected.to have_many(:assignments)                       }
    it { is_expected.to have_many(:projects).through(:assignments)    }
    it { is_expected.to have_many(:employments)                       }
    it { is_expected.to have_many(:departments).through(:employments) }
    it { is_expected.to have_many(:managed_departments)               }
  end
  
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
