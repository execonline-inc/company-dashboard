list = []

CSV.foreach("./todo_list.csv", :headers => true) do |row|
  list.push({:label => row[0], :value => row[1]})
end


SCHEDULER.every '5s' do
  send_event('todo_list',  { items:  list})
end