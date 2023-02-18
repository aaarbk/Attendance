class AttendanceController < ApplicationController
  def welcome
  end

  def proc
    puts "The card number is #{params}"
    e = Employee.with_card  params[:card_num]
    if e
      if e.has_pending_shift?
        flash[:notice] = "#{e} is clocking in."
        if e.pending_shift.update!(clockin_time:Time.now)
          flash[:notice] = "clocked in"

        else
          flash[:notice] = "issue clocking in"
        end

      elsif e.is_working_shift?
        flash[:notice] = "#{e} is clocking out!"
        if e.working_shift.update!(clockout_time:Time.now)
         flash[:notice] = "clocked out"
        else
          flash[:notice] = "issue clocking out"
        end
      else
        flash[:notice] = "No pending shift!"
      end
    else
      flash[:notice] = "Employee doesn't exist!"
    end
    redirect_to "/welcome"
  end
  
end
