import React from 'react'

import { Link } from 'react-router-dom'

import ButtonAddRecipe from '../../components/AddRecipe'
import Navs from '../../components/Navs'
import { Box, Breadcrumbs, Grid, Typography } from '@mui/material'

import RatingList from './RatingList'
import SearchBox from './RatingList/Search'
import Sort from './RatingList/Sort'

const Bookmark = () => {
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
                        My Rating
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
                        <Box display="flex" justifyContent="space-between" alignItems="center">
                            <SearchBox />
                            <Sort />
                        </Box>
                        <RatingList />
                    </Grid>
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default Bookmark
