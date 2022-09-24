import React from 'react'

import { Box, Grid } from '@mui/material'

import Navs from './Navs'

const Bookmark = () => {
    return (
        <Box mt={8}>
            <Grid container columnSpacing={4}>
                <Grid item md={3}>
                    <Navs />
                </Grid>
                <Grid item md={9}></Grid>
            </Grid>
        </Box>
    )
}

export default Bookmark
