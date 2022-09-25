import React from 'react'

import ButtonAddRecipe from '../../components/AddRecipe'
import Navs from '../../components/Navs'
import { Box, Grid } from '@mui/material'

import Info from './Info'

const Profile = () => {
    return (
        <Box mt={8}>
            <Grid container columnSpacing={4}>
                <Grid item md={3}>
                    <Navs />
                    <ButtonAddRecipe />
                </Grid>
                <Grid item md={9} display="flex" flexDirection="column">
                    <Info />
                </Grid>
            </Grid>
        </Box>
    )
}

export default Profile
