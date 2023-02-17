class Employee < ApplicationRecord
  belongs_to :location

  has_many :shift_assignments
  has_many :shifts, through: :shift_assignments

  def self.with_card c
    self.find_by(card_num: c)
  end

  def pending_shift # nil if no pending shift
    s = self.shifts.ongoing
    return nil if s.empty?
    s.first.shift_assignments.where(employee_id:self.id).where(clockin_time:nil).first
  end

  def has_pending_shift?
    pending_shift.present?
  end


  def working_shift
    s = self.shift_assignments.where.not(clockin_time:nil).where(clockout_time:nil)
    return nil if s.empty?
    s
  end
  def is_working_shift?
    working_shift.present?
  end


  #def is_working_shift?
  #  unless (self.shift_assignments.nil? or self.shift_assignments.last.nil?)
  #    (!has_pending_shift? and self.shift_assignments.last.clockout_time.nil?) 
  #  end
  #  false
  #end
end
