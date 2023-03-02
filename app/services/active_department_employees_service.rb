class ActiveDepartmentEmployeesService
  def call
    Employee.select('employments.registration', 'employees.name', 'employees.id', 'departments.name AS department')
            .joins(employments: :department)
            .where(employments: { ends_on: nil })
  end
end
