import React from 'react'

import { Assignment, Search } from '@mui/icons-material'
import { Box, IconButton, InputBase, Pagination, Typography } from '@mui/material'
import { grey, blueGrey } from '@mui/material/colors'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import RecipeList from './RecipeList'

const MyRecipes = () => {
    return (
        <Box>
            <Box ml={2} display="flex" alignItems="center">
                <Assignment fontSize="large" sx={{ color: grey[700] }} />
                <Typography ml={1} variant="h4" fontWeight={700} sx={{ color: grey[700] }}>
                    Recently Recipes
                </Typography>
                <Box
                    component="form"
                    ml={50}
                    sx={{
                        p: 0.5,
                        display: 'flex',
                        alignItems: 'center',
                        width: 380,
                        border: `1px solid ${blueGrey[200]}`,
                        borderRadius: 0.5,
                    }}
                >
                    <InputBase
                        sx={{ ml: 3, flex: 1 }}
                        placeholder="Search recipe name"
                        inputProps={{ 'aria-label': 'search recipe name' }}
                    />
                    <IconButton type="button" sx={{ p: '10px' }} aria-label="search">
                        <Search />
                    </IconButton>
                </Box>
            </Box>
            <RecipeList posts={MOST_FAVORITE_POSTS} />
            <Box display="flex" justifyContent="center" mt={4}>
                <Pagination count={10} variant="outlined" sx={{ alignSelf: 'center', mt: 6 }} />
            </Box>
        </Box>
    )
}

export default MyRecipes
