import React from 'react'

import { Box, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

const MyRecipes = () => {
    return (
        <Box>
            <Typography variant="h4" fontWeight={700} sx={{ color: grey[700] }}>
                Recently Recipes
            </Typography>
        </Box>
    )
}

export default MyRecipes
