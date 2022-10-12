import React from 'react'

import { useHistory } from 'react-router-dom'

import { Box, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import LatestList from './Recipes'

const Recipes = ({ posts, title, linkTo }) => {
    const history = useHistory()

    return (
        <Box mt={8}>
            <Typography
                variant="h4"
                fontWeight={700}
                sx={{
                    color: grey[600],
                    pb: 0.125,
                    mb: 3,
                    borderBottom: (theme) => `5px solid ${theme.palette.primary.main}`,
                    display: 'inline-block',
                    cursor: 'pointer',
                }}
                onClick={() => history.push(linkTo)}
                component="span"
            >
                {title}
            </Typography>
            <LatestList posts={posts} />
        </Box>
    )
}

export default Recipes
