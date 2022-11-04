import React from 'react'

import { Box } from '@mui/material'

import LatestList from './Recipes'

const Recipes = ({ posts, reportHandler, confirmHandler }) => {
    return (
        <Box mt={3}>
            <LatestList
                posts={posts}
                reportHandler={reportHandler}
                confirmHandler={confirmHandler}
            />
        </Box>
    )
}

export default Recipes
