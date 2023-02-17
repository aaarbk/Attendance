class Employee < ApplicationRecord
  belongs_to :location

  has_many :shift_assignments
  has_many :shifts, through: :shift_assignments

  def self.with_card c
    self.find_by(card_num: c)
  end

  def has_pending_shift?
    self.shift_assignments.last.clockin_time.nil? unless self.shift_assignments.nil?
  end

  def is_working_shift?
    (!has_pending_shift? and self.shift_assignments.last.clockout_time.nil?) unless self.shift_assignments.nil?
  end
end
