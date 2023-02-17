class AttendanceController < ApplicationController
  def welcome
  end

  def proc
    puts "Hi, Hessa!"
    puts "The card number is #{params}"

  end
end
