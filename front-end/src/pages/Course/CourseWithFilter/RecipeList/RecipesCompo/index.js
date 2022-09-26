import React from 'react'

import { Box } from '@mui/material'

import LatestList from './Recipes'

const Recipes = ({ posts }) => {
    return (
        <Box mt={3}>
            <LatestList posts={posts} />
        </Box>
    )
}

export default Recipes
