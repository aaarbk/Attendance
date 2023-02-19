class ShiftAssignment < ApplicationRecord
  belongs_to :employee
  belongs_to :shift

  def self.create_shift_assignments(shift_ids, employee_ids)
    shift_ids.each do |shift_id|
      employee_ids.each do |employee_id|
        ShiftAssignment.create(shift_id: shift_id, employee_id: employee_id)
      end
    end
  end

end
