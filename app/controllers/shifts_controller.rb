class ShiftsController < ApplicationController
    # new (for form)
    def new
        #@shift = Shift.new
        @employees = Employee.all
    end

    def create
        puts "The shift details are #{params['shift']}"
        s = params['shift']['start_time'].to_date
        e = params['shift']['end_time'].to_date
        
        @shift = Shift.new
        @shift.start_time = s
        @shift.end_time = e

        if @shift.save
            redirect_to root_path, notice: 'Shift created successfully!'
        else
            render :new
        end
    end

   #def shift_params
   #     params.require(:shift).permit(:start_date, :end_date)
   # end

end
