import React from 'react'

import { Link } from 'react-router-dom'

import ButtonAddRecipe from '../../components/AddRecipe'
import Navs from '../../components/Navs'
import { Box, Breadcrumbs, Grid, Typography } from '@mui/material'

import BookmarkList from './BookmarkList'

const Rating = () => {
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
                        Saved Recipes
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
                        <BookmarkList />
                    </Grid>
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default Rating
