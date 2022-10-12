import React from 'react'

import { Link } from 'react-router-dom'

import { Box, Button } from '@mui/material'
import { grey } from '@mui/material/colors'

const ButtonAddRecipe = () => {
    return (
        <Box width="100%" display="flex" justifyContent="center" mt={3}>
            <Button
                component={Link}
                to="/recipes/create"
                variant="contained"
                sx={{ color: grey[100] }}
            >
                ADD A RECIPE
            </Button>
        </Box>
    )
}

export default ButtonAddRecipe
