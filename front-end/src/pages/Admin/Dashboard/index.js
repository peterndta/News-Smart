import React from 'react'

import { Box, Grid, Paper, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import Chart from './Chart'
import Doughnut from './Chart/Doughnut'
import LatestAccounts from './LatestAccounts'
import StatisticCards from './StatisticCards'

const Dashboard = () => {
    return (
        <React.Fragment>
            <Box mt={8}>
                <Box mb={4.5}>
                    <Typography variant="h3" fontWeight={700} sx={{ color: blueGrey[800] }}>
                        Dashboard
                    </Typography>
                </Box>
                <StatisticCards />
                <Chart />
                <Grid mt={1} container spacing={3}>
                    <Grid item xs={12} md={6} lg={7}>
                        <Paper elevation={3} sx={{ borderRadius: 4 }}>
                            <Doughnut />
                        </Paper>
                    </Grid>
                    <Grid item xs={12} md={6} lg={5}>
                        <Paper elevation={3} sx={{ borderRadius: 2, height: '100%' }}>
                            <LatestAccounts />
                        </Paper>
                    </Grid>
                </Grid>
                {/* <Box mt={4} display="flex" alignItems="center" justifyContent="center">
                    <Paper
                        elevation={3}
                        sx={{ borderRadius: 4 }}
                        style={{ width: 500, height: 550 }}
                    >
                        <Doughnut />
                    </Paper>
                </Box> */}
            </Box>
        </React.Fragment>
    )
}

export default Dashboard
