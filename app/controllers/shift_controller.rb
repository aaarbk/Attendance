class ShiftController < ApplicationController
    # new (for form)
    def new
        @shift = Shift.new
    end

    def create
        @shift = Shift.new(shift_params)
        if @shift.save
            redirect_to root_path, notice: 'Shift created successfully!'
        else
            render :new
        end
    end

    def shift_params
        params.require(:shift).permit(:start_date, :end_date)
    end

end
