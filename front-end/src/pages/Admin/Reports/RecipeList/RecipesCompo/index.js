import React from 'react'

import { Box } from '@mui/material'

import LatestList from './Recipes'

const Recipes = ({ posts, reportHandler }) => {
    return (
        <Box mt={3}>
            <LatestList posts={posts} reportHandler={reportHandler} />
        </Box>
    )
}

export default Recipes
