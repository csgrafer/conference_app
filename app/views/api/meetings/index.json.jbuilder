json.array! @meetings.each do |meeting|
  json.id meeting.id
  json.title meeting.title
  json.agenda meeting.agenda
  json.time meeting.time
  # json.partial! "meeting.json.jbuilder", meeting: meeting
end