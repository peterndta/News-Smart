import React from 'react'

import { Box, Typography } from '@mui/material'

import CreateRecipeForm from './CreareRecipeForm'

const CreateRecipe = () => {
    return (
        <Box mt={8}>
            <Typography variant="h3" align="center" color="primary" fontWeight={700}>
                Create Recipe
            </Typography>
            <CreateRecipeForm />
        </Box>
    )
}

export default CreateRecipe
