class AttendanceController < ApplicationController
  def welcome
  end

  def proc
    puts "The card number is #{params}"
    e = Employee.with_card  params[:card_num]
    if e
      if e.has_pending_shift?
        puts "#{e} is clocking in!"
        if e.pending_shift.update!(clockin_time:Time.now)
          puts "*************"
          puts "SAVED"
          puts "*************"
        else
          puts "*************"
          puts "NOT SAVED"
          puts "*************"
        end

      elsif e.is_working_shift?
        puts "#{e} is clocking out!"
        if e.working_shift.update!(clockout_time:Time.now)
          puts "*************"
          puts "SAVED"
          puts "*************"
        else
          puts "*************"
          puts "NOT SAVED"
          puts "*************"
        end
      else
        puts "#{e} does not have a pending/working shift"
      end
    else
      puts "Employee doesn't exist!"
    end

  end
end
