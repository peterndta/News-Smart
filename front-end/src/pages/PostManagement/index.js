import React from 'react'

import { Box, Grid } from '@mui/material'

import Filter from './Filters'
import PostList from './PostList'

const Rating = () => {
    return (
        <Box mt={8}>
            <Grid container columnSpacing={4}>
                <Filter />
                <Grid item md={9} display="flex" flexDirection="column">
                    <PostList />
                </Grid>
            </Grid>
        </Box>
    )
}

export default Rating
