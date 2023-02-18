Shift.create!([
  {start_time: "2023-02-16 19:08:05", end_time: "2023-02-17 03:08:05"},
  {start_time: "2023-02-18 16:50:54", end_time: "2023-02-18 20:50:54"}
  
])
Location.create!([
  {name: "AlWaab", address: "XYZ Street"}
])
Employee.create!([
  {card_num: "12345", first_name: "Mashael", last_name: "Alemadi", email: "mashael@example.com", phone: "50082008", role: 1, location_id: 1},
  {card_num: "11221", first_name: "Hessa", last_name: "Boday", email: nil, phone: nil, role: 3, location_id: 1}
])

ShiftAssignment.create!([
  {employee_id: 1, shift_id: 1, clockin_time: "2023-02-18 18:57:54", clockout_time: "2023-02-18 18:58:00"},
  {employee_id: 1, shift_id: 2, clockin_time: "2023-02-16 19:09:02", clockout_time: "2023-02-17 03:09:02"},
  {employee_id: 2, shift_id: 2, clockin_time: "2023-02-16 20:09:45", clockout_time: "2023-02-17 02:09:45"}
])