 get '/notes/calendar' do
  gon.notes = all_notes().to_a

  erb :'calendar/cal-index', local: {
    note_dates: note_dates
  } 
end