# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project do
  describe 'Associations' do
    it { is_expected.to have_many :assignments }
    it { is_expected.to have_many(:employees).through(:assignments) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name                                                 }
    it { is_expected.to validate_presence_of :starts_on                                            }
    it { is_expected.to validate_numericality_of(:budget).allow_nil.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:spent).allow_nil.is_greater_than_or_equal_to(0)  }

    context 'when creating a project with end date bigger than start date' do
      let(:wrong_time_project) { build(:project, :with_wrong_schedule) }

      it 'returns an invalid project' do
        expect(wrong_time_project.invalid?).to be true
      end

      it 'issues a message telling the project end date cannot be bigger than project start date' do
        project = build(:project, :with_wrong_schedule)
        project.valid?
        expect(project.errors[:ends_on]).not_to be_empty
      end
    end

    context 'when creating a project with correct project schedule' do
      let(:right_time_project) { create(:project) }

      it 'returns a valid project' do
        expect(right_time_project.valid?).to be true
      end

      it 'successfully creates an project object' do
        expect { create(:project) }.to change(described_class, :count).by(1)
      end
    end
  end
end
