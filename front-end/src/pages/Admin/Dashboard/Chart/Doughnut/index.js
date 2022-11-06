import React, { useState } from 'react'

import { Chart as ChartJS, Legend, Title, Tooltip, ArcElement } from 'chart.js'
import { Doughnut } from 'react-chartjs-2'

ChartJS.register(ArcElement, Title, Tooltip, Legend)

const DoughnutChart = ({ statis }) => {
    const [postMostBookmarked, setPostMostBookmarked] = useState({
        labels: statis.topPostByBookmark.map((data) => data.name),
        datasets: [
            {
                data: statis.topPostByBookmark.map((data) => data.totalBookmark),
                backgroundColor: ['#FF6384', '#FF9F40', '#FFCD56', '#4BC0C0', '#36A2EB'],
                rOffset: 4,
            },
        ],
    })
    return (
        <React.Fragment>
            <Doughnut
                data={postMostBookmarked}
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
