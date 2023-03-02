# frozen_string_literal: true

DEPARTMENTS = %w[Development HR Art Audio].freeze

DEV_POSITIONS   = ['Lead Programmer', 'IT Manager', 'Senior Programmer', 'Programmer'].freeze
ART_POSITIONS   = ['Senior Artist', 'Concept Artist', 'Artist'].freeze
HR_POSITIONS    = ['Recruiting Assistant', 'HR Analyst'].freeze
AUDIO_POSITIONS = ['Audio Engineer', 'Composer'].freeze

PROJECTS = ['Chores of Damnation (PS4)', 'Lords Mobile', 'Supercell Season 42 Affairs'].freeze

15.times { FactoryBot.create(:employee) }
employees = Employee.all

DEPARTMENTS.each { |department| FactoryBot.create(:department, name: department, manager_id: employees.sample.id) }

DEV_POSITIONS.each   { |position| FactoryBot.create(:position, name: position) }
ART_POSITIONS.each   { |position| FactoryBot.create(:position, name: position) }
HR_POSITIONS.each    { |position| FactoryBot.create(:position, name: position) }
AUDIO_POSITIONS.each { |position| FactoryBot.create(:position, name: position) }

PROJECTS.each { |project| FactoryBot.create(:project, name: project) }

8.times { FactoryBot.create(:assignment, employee: employees.sample, project: Project.all.sample) }
7.times { FactoryBot.create(:employment, :active, employee: employees.sample, position: Position.all.sample, department: Department.all.sample) }
3.times { FactoryBot.create(:employment, :inactive, employee: employees.sample, position: Position.all.sample, department: Department.all.sample) }