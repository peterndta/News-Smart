import React, { useEffect, useState } from 'react'

import NotFound from '../../../components/NotFound'
import { Box, Grid, Paper, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import { useSnackbar } from '../../../HOCs/SnackbarContext'
import { useStatisAction } from '../../../recoil/dashboard'
import Loading from '../../Loading'
import Chart from './Chart'
import Doughnut from './Chart/Doughnut'
import LatestAccounts from './LatestAccounts'
import StatisticCards from './StatisticCards'

const Dashboard = () => {
    const [statis, setStatis] = useState({})
    const [isFirstRender, setIsFirstRender] = useState(true)
    const { getStatistic } = useStatisAction()
    const showSnackbar = useSnackbar()
    const [error, setError] = useState(false)
    useEffect(() => {
        getStatistic()
            .then((response) => {
                const data = response.data.data
                setStatis(data)
                setIsFirstRender(false)
            })
            .catch(() => {
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
                setError(true)
                setIsFirstRender(false)
            })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [])
    if (error) return <NotFound isLoading={isFirstRender} />
    return (
        <React.Fragment>
            {isFirstRender ? (
                <Loading />
            ) : (
                <Box mt={8}>
                    <Box mb={4.5}>
                        <Typography variant="h3" fontWeight={700} sx={{ color: blueGrey[800] }}>
                            Dashboard
                        </Typography>
                    </Box>
                    <StatisticCards statis={statis} />
                    <Chart statis={statis} />
                    <Grid mt={1} container spacing={3}>
                        <Grid item xs={12} md={6} lg={6.5}>
                            <Paper elevation={3} sx={{ borderRadius: 4, height: '100%' }}>
                                <Doughnut statis={statis} />
                            </Paper>
                        </Grid>
                        <Grid item xs={12} md={6} lg={5.5}>
                            <Paper elevation={3} sx={{ borderRadius: 2, height: '100%' }}>
                                <LatestAccounts statis={statis} />
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
            )}
        </React.Fragment>
    )
}

export default Dashboard
