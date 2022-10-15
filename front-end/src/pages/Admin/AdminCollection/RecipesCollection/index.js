import React from 'react'

import { Box, Grid } from '@mui/material'

import CollectionTab from './CollectionTab'
import PostList from './PostList'
import RecipeFilterName from './RecipeFilterName'

const RecipesCollection = () => {
    return (
        <React.Fragment>
            <RecipeFilterName />
            <Box mt={8}>
                <Grid container columnSpacing={4}>
                    <CollectionTab />
                    <Grid item md={9} display="flex" flexDirection="column">
                        <PostList />
                    </Grid>
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default RecipesCollection
