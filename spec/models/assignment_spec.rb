# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Assignment do
  describe 'Associations' do
    it { is_expected.to belong_to :employee }
    it { is_expected.to belong_to :project  }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:starts_on) }

    context 'when creating an assignment with wrong schedule' do
      let(:wrong_assignment) { build(:assignment, :with_wrong_schedule) }

      it 'returns an invalid assignment' do
        expect(wrong_assignment.invalid?).to be true
      end

      it 'issues an error message telling the end date cannot be bigger than the start date' do
        assignment = build(:assignment, :with_wrong_schedule)
        assignment.valid?
        expect(assignment.errors[:ends_on]).not_to be_empty
      end
    end

    context 'when creating an assignment with correct schedule' do
      let(:correct_assignment) { build(:assignment) }

      it 'returns a valid assignment' do
        expect(correct_assignment.valid?).to be true
      end

      it 'creates a new assignment object' do
        expect { create(:assignment) }.to change(described_class, :count).by(1)
      end
    end
  end
end
