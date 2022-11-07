import React from 'react'

import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend,
} from 'chart.js'
import { Bar } from 'react-chartjs-2'

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend)

const HorizontalBar = ({ userMostPost }) => {
    return (
        <React.Fragment>
            <Bar
                data={userMostPost}
                options={{
                    indexAxis: 'y',
                    elements: {
                        bar: {
                            borderWidth: 2,
                        },
                    },
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false,
                        },
                        title: {
                            display: true,
                            text: 'Top 5 Accounts with The Most Posts',
                        },
                    },
                    scales: {
                        yAxis: {
                            ticks: {
                                callback: function (value) {
                                    if (this.getLabelForValue(value).length > 6) {
                                        return this.getLabelForValue(value).substr(0, 6) + '...'
                                    } else {
                                        return this.getLabelForValue(value)
                                    }
                                },
                            },
                        },
                    },
                }}
            />
        </React.Fragment>
    )
}

export default HorizontalBar
