import React from 'react'

import { Link } from 'react-router-dom'

import NotificationsIcon from '@mui/icons-material/Notifications'
import { Box, Breadcrumbs, Grid, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import Mine from './Mine'
import Sort from './Mine/Sort'

const Notification = () => {
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
                        Notification
                    </Typography>
                </Breadcrumbs>
            </Box>
            <Box mt={4}>
                <Grid container columnSpacing={4}>
                    <Grid item md={12} display="flex" flexDirection="column">
                        <Box display="flex" justifyContent="space-between" alignItems="center">
                            <Box display="flex" alignItems="center">
                                <Typography
                                    mr={0.2}
                                    variant="h4"
                                    fontWeight={700}
                                    sx={{
                                        color: grey[600],
                                        borderBottom: (theme) =>
                                            `3.5px solid ${theme.palette.primary.main}`,
                                    }}
                                >
                                    Notification
                                </Typography>
                                <NotificationsIcon fontSize="large" color="action" />
                            </Box>
                            <Sort />
                        </Box>
                        <Mine />
                    </Grid>
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default Notification
