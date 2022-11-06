import React from 'react'

import { Chart as ChartJS, Legend, Title, Tooltip, ArcElement } from 'chart.js'
import { Doughnut } from 'react-chartjs-2'

ChartJS.register(ArcElement, Title, Tooltip, Legend)

const labels = ['Nguyen Dang Truong Anh (K15HCM)', 'Duong Gia Phat', 'Hien Bui', 'Khuong', 'Su']

export const data = {
    labels,
    datasets: [
        {
            label: 'Number of rating',
            data: [700, 200, 300, 400, 600],
            backgroundColor: ['#FF6384', '#FF9F40', '#FFCD56', '#4BC0C0', '#36A2EB'],
            rOffset: 4,
        },
    ],
}

const DoughnutChart = () => {
    return (
        <React.Fragment>
            <Doughnut
                data={data}
                options={{
                    plugins: {
                        datalabels: {
                            display: true,
                            align: 'bottom',
                            backgroundColor: '#ccc',
                            borderRadius: 3,
                            font: {
                                size: 18,
                            },
                        },
                        title: {
                            display: true,
                            text: 'Top 5 Most Bookmarked Post',
                        },
                    },
                }}
            />
        </React.Fragment>
    )
}

export default DoughnutChart
