import React from 'react'

import { Box, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const RecipeFilterName = () => {
    return (
        <Box
            sx={{
                position: 'relative',
                height: 100,
                backgroundColor: '#FFDDB8',
            }}
        >
            <Box
                sx={{
                    position: 'absolute',
                    bottom: -10,
                    left: 100,
                    backgroundColor: '#fefefe',
                    py: 1,
                    pl: 3,
                    width: 500,
                    border: '1px solid #000',
                }}
            >
                <Typography variant="h4" fontWeight={700} sx={{ color: blueGrey[800] }}>
                    Recipes
                </Typography>
            </Box>
        </Box>
    )
}

export default RecipeFilterName
