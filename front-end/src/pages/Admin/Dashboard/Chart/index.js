import React from 'react'

import { Grid, Paper } from '@mui/material'

import HorizontalBar from './HorizontalBar'
import VerticalBar from './VerticalBar'

const Chart = () => {
    return (
        <React.Fragment>
            <Grid container spacing={3}>
                <Grid item xs={12} md={6} lg={6}>
                    <Paper elevation={3} sx={{ borderRadius: 4 }} style={{ height: 320 }}>
                        <HorizontalBar />
                    </Paper>
                </Grid>
                <Grid item xs={12} md={6} lg={6}>
                    <Paper elevation={3} sx={{ borderRadius: 4 }} style={{ height: 320 }}>
                        <VerticalBar />
                    </Paper>
                </Grid>
            </Grid>
        </React.Fragment>
    )
}

export default Chart
