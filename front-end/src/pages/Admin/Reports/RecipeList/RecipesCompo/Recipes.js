import React from 'react'

import { Grid } from '@mui/material'

import LatestRecipe from './Recipe'

const LatestList = ({ posts, reportHandler, confirmHandler }) => {
    return (
        <Grid container rowSpacing={6} columnSpacing={4} display="flex">
            {posts?.map((post) => (
                <LatestRecipe
                    key={post.id}
                    post={post}
                    reportHandler={reportHandler}
                    confirmHandler={confirmHandler}
                />
            ))}
        </Grid>
    )
}

export default LatestList
