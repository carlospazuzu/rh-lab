# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employment do
  describe 'Associations' do
    it { is_expected.to belong_to :employee   }
    it { is_expected.to belong_to :department }
    it { is_expected.to belong_to :position   }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:salary) }
    it { is_expected.to validate_numericality_of(:salary).is_greater_than(0) }
    it { is_expected.to validate_presence_of(:registration) }
    it { is_expected.to validate_presence_of(:starts_on) }

    context 'when creating a employment with wrong schedule' do
      let(:wrong_employment) { build(:employment, :with_wrong_schedule) }

      it 'returns an invalid employment' do
        expect(wrong_employment.invalid?).to be true
      end

      it 'issues an error message telling the end date cannot be bigger than the start date' do
        employment = build(:employment, :with_wrong_schedule)
        employment.valid?
        expect(employment.errors[:ends_on]).not_to be_empty
      end
    end

    context 'when creating a employment with correct schedule' do
      let(:correct_employment) { build(:employment) }

      it 'returns a valid employment' do
        expect(correct_employment.valid?).to be true
      end

      it 'successfully creates a new employment' do
        expect { create(:employment) }.to change(described_class, :count).by(1)
      end
    end
  end
end
