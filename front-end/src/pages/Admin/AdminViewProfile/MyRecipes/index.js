import React from 'react'

import { Assignment } from '@mui/icons-material'
import { Box, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import Paging from './Pagination'
import RecipeList from './RecipeList'
import SearchBox from './Search'

const MyRecipes = () => {
    return (
        <Box>
            <Box display="flex" alignItems="flex-end" justifyContent="space-between" m={4}>
                <Box display="flex" alignItems="center">
                    <Assignment fontSize="large" sx={{ color: grey[700] }} />
                    <Typography ml={1} variant="h4" fontWeight={700} sx={{ color: grey[700] }}>
                        Recently Recipes
                    </Typography>
                </Box>
                <SearchBox />
            </Box>
            <RecipeList posts={MOST_FAVORITE_POSTS} />
            <Paging />
        </Box>
    )
}

export default MyRecipes
