import React from 'react'

import { Grid } from '@mui/material'

import LatestRecipe from './Recipe'

const LatestList = ({ posts }) => {
    return (
        <Grid container rowSpacing={3} columnSpacing={4} display="flex" justifyContent="center">
            {posts.map((post) => (
                <LatestRecipe key={post.id} post={post} />
            ))}
        </Grid>
    )
}

export default LatestList
