import React from 'react'

import Navs from '../../components/Navs'
import { Box, Grid } from '@mui/material'

import BookmarkList from './BookmarkList'

const Bookmark = () => {
    return (
        <Box mt={8}>
            <Grid container columnSpacing={4}>
                <Grid item md={3}>
                    <Navs />
                </Grid>
                <Grid item md={9} display="flex" flexDirection="column">
                    <BookmarkList />
                </Grid>
            </Grid>
        </Box>
    )
}

export default Bookmark
