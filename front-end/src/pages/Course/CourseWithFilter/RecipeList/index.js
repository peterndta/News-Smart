import React from 'react'

import { Grid } from '@mui/material'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import Paging from '../Pagination'
import Sort from '../Sort'
import Recipes from './RecipesCompo'

const RecipeList = () => {
    return (
        <Grid item md={9} display="flex" flexDirection="column">
            <Sort />
            <Recipes posts={MOST_FAVORITE_POSTS} />
            <Paging size={5} />
        </Grid>
    )
}

export default RecipeList
