class Shift < ApplicationRecord
    has_many :shift_assignments
    has_many :employees, through: :shifts

  def self.create_shifts(start_date, end_date, shift_start_time, shift_end_time, which_days=(0...7))
    start_time = Time.parse(shift_start_time)
    end_time = Time.parse(shift_end_time)

    shift_ids = (Date.parse(start_date)..Date.parse(end_date)).map do |date|
      start_datetime = DateTime.new(date.year, date.month, date.day, start_time.hour, start_time.min, 0)
      end_datetime = DateTime.new(date.year, date.month, date.day, end_time.hour, end_time.min, 0)

      Shift.create(start_time: start_datetime, end_time: end_datetime).id if which_days.include? date.wday
    end

    return shift_ids
  end

    #def self.ongoing
    #    self.find_by("start_time <= ? and ? < end_time", Time.now, Time.now)
    #end

    scope :ongoing, ->{where("start_time <= ? and ? < end_time", Time.now, Time.now)} # possibly more than one (if multiple location, but currently we only have one location)
    
    scope :future, ->{where("start_time > ?", Time.now)}


end
