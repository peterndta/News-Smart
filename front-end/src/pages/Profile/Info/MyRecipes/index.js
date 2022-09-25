import React from 'react'

import { Box, Pagination, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import RecipeList from './RecipeList'

const MyRecipes = () => {
    return (
        <Box>
            <Typography variant="h4" fontWeight={700} sx={{ color: grey[700] }}>
                Recently Recipes
            </Typography>
            <RecipeList posts={MOST_FAVORITE_POSTS} />
            <Box display="flex" justifyContent="center">
                <Pagination count={10} variant="outlined" sx={{ alignSelf: 'center', mt: 6 }} />
            </Box>
        </Box>
    )
}

export default MyRecipes
