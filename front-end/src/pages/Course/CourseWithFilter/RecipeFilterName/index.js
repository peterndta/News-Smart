import React from 'react'

import { Box, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

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
                    width: 300,
                    border: `1px solid ${grey[500]}`,
                    borderRadius: 4,
                }}
            >
                <Typography variant="h4" fontWeight={700} sx={{ color: blueGrey[800] }}>
                    Collection
                </Typography>
            </Box>
        </Box>
    )
}

export default RecipeFilterName
