# Note: change this to obtain your chart data from some external source
labels = [ 'Highly Likely', 'Likely', 'Neutral', 'Highly Unlikely' ]
data = [
    {
        data: [48, 18, 18, 1 ],
        backgroundColor: [
            '#F7464A',
            '#46BFBD',
            '#FDB45C',
            '#fff'
        ],
        hoverBackgroundColor: [
            '#FF6384',
            '#36A2EB',
            '#FFCE56',
            'red'
        ],
    },
]
options = { }

send_event('doughnutchart2', { labels: labels, datasets: data, options: options })