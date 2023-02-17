class Shift < ApplicationRecord
    has_many :shift_assignments
    has_many :employees, through: :shifts

    #def self.ongoing
    #    self.find_by("start_time <= ? and ? < end_time", Time.now, Time.now)
    #end

    scope :ongoing, ->{where("start_time <= ? and ? < end_time", Time.now, Time.now)}
    scope :future, ->{where("start_time > ?", Time.now)}


end
