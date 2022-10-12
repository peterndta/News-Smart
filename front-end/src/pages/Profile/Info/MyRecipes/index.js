import React from 'react'

import { Link } from 'react-router-dom'

import { Box, Button, Typography } from '@mui/material'
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
            <Box display="flex" justifyContent="center" mt={6}>
                <Button
                    variant="contained"
                    size="large"
                    sx={{ color: grey[100] }}
                    component={Link}
                    to="/recipes/me"
                >
                    Show more
                </Button>
            </Box>
        </Box>
    )
}

export default MyRecipes
