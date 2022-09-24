import React from 'react'

import { Box, Grid } from '@mui/material'

import Filter from './Filters'
import RecipeFilterName from './RecipeFilterName'
import RecipeList from './RecipeList'

const RecipeListWithFilter = () => {
    return (
        <React.Fragment>
            <RecipeFilterName />
            <Box mt={6}>
                <Grid container columnSpacing={4}>
                    <Filter />
                    <RecipeList />
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default RecipeListWithFilter
