import React from 'react'

import ButtonAddRecipe from '../../components/AddRecipe'
import Navs from '../../components/Navs'
import { Box, Grid } from '@mui/material'

import BookmarkList from './BookmarkList'

const Rating = () => {
    return (
        <Box mt={8}>
            <Grid container columnSpacing={4}>
                <Grid item md={3}>
                    <Navs />
                    <ButtonAddRecipe />
                </Grid>
                <Grid item md={9} display="flex" flexDirection="column">
                    <BookmarkList />
                </Grid>
            </Grid>
        </Box>
    )
}

export default Rating
