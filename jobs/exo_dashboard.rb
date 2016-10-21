
require 'csv'
users = CSV.read('./students.csv')

labels = [ 'In Dev', 'In QA', 'Recent To Prod' ]

data = [
    {
        data: [15, 5, 10],
        backgroundColor: [
            '#F7464A',
            '#46BFBD',
            '#FDB45C',
        ],
        hoverBackgroundColor: [
            '#FF6384',
            '#36A2EB',
            '#FFCE56',
        ],
    },
]
options = { }

goal = 1500000.0
value_at_now = 1000000.0
percentage = (value_at_now/goal) * 100

atl_goal = 20000.0
atl_at_now = 500
percent = (atl_at_now/atl_goal) * 100

list = []
CSV.foreach("./current_users.csv", :headers => true) do |row|
  list.push({:label => row[0], :value => row[3]})
end


SCHEDULER.every '5s' do
  send_event('piechart', { labels: labels, datasets: data, options: options })
  send_event('sales_total', { value: percentage.round, moreinfo: "$#{value_at_now}: #{percentage.round}%" })
  send_event('total_atl_bookings', { value: percent.round, moreinfo: "$#{atl_at_now}: #{percent.round}%" })
  send_event('enrolled_students', { current: users.size.next})
  send_event('all_users', { current: 8000})
  send_event('student_breakdown',  { items:  list})
end