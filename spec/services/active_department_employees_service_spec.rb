# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActiveDepartmentEmployeesService do
  context 'when there are no records' do
    let(:result) { described_class.new.call }

    it 'returns an empty array' do
      expect(result).to be_empty
    end
  end

  context 'when there are saved records' do
    let!(:active_employments) { create(:employment, :active) }

    it 'returns instances of employees objects' do
      employees = described_class.new.call
      expect(employees.first).to be_an_instance_of(Employee)
    end

    it 'returns employees objects with active departments' do
      employees = described_class.new.call
      expect(employees.first.employments.first.ends_on).to be_nil
    end
  end
end