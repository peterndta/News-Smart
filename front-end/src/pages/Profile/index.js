import React from 'react'

import { Link } from 'react-router-dom'

import ButtonAddRecipe from '../../components/AddRecipe'
import Navs from '../../components/Navs'
import { Box, Breadcrumbs, Grid, Typography } from '@mui/material'

import Info from './Info'

const Profile = () => {
    return (
        <React.Fragment>
            <Box mt={4}>
                <Breadcrumbs separator="›" aria-label="breadcrumb">
                    <Link
                        to="/"
                        style={{ color: '#637381', textDecoration: 'none' }}
                        fontWeight={700}
                    >
                        Home
                    </Link>
                    <Typography color="text.primary" fontWeight={700}>
                        Personal Info
                    </Typography>
                </Breadcrumbs>
            </Box>
            <Box mt={4}>
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
        </React.Fragment>
    )
}

export default Profile
