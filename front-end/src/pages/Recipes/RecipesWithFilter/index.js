import React from 'react'

import { Box, Grid } from '@mui/material'

import Filter from './Filters'
import RecipeFilterName from './RecipeFilterName'

const RecipeListWithFilter = () => {
    return (
        <React.Fragment>
            <RecipeFilterName />
            <Box mt={6}>
                <Grid container>
                    <Filter />
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default RecipeListWithFilter
