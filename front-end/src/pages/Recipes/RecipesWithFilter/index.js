import React from 'react'

import { Box, Grid } from '@mui/material'

import Filter from './Filters'
import RecipeFilterName from './RecipeFilterName'
import RecipeList from './RecipeList'
import SearchBox from './Search'
import Sort from './Sort'

const RecipeListWithFilter = () => {
    return (
        <React.Fragment>
            <RecipeFilterName />
            <Box mt={6}>
                <Grid container columnSpacing={4}>
                    <Filter />
                    <Grid item md={9}>
                        <Grid
                            item
                            md={12}
                            display="flex"
                            justifyContent="space-between"
                            alignItems="flex-start"
                            sx={{ flexShrink: 0 }}
                        >
                            <SearchBox />
                            <Sort />
                        </Grid>
                        <RecipeList />
                    </Grid>
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default RecipeListWithFilter
