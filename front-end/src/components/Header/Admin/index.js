import React from 'react'

import { Link, NavLink } from 'react-router-dom'

import { AccountCircle } from '@mui/icons-material'
import {
    AppBar,
    Avatar,
    Box,
    Button,
    Container,
    IconButton,
    Toolbar,
    Typography,
} from '@mui/material'
import { grey, yellow } from '@mui/material/colors'

import logo from '../../../assets/images/logo.png'
import Search from '../../Search'

const AdminHeader = () => {
    return (
        <AppBar position="static">
            <Container maxWidth="xl">
                <Toolbar disableGutters>
                    <Box
                        display="flex"
                        justifyContent="space-between"
                        alignItems="center"
                        width="100%"
                    >
                        <Box display="flex" alignItems="center">
                            <Box
                                sx={{
                                    display: 'flex',
                                    justifyContent: 'flex-start',
                                    py: 0.5,
                                }}
                            >
                                <Link to="/admin">
                                    <Box>
                                        <Avatar
                                            sx={{ height: 50, width: 150 }}
                                            src={logo}
                                            alt="logo"
                                        ></Avatar>
                                    </Box>
                                </Link>
                            </Box>
                            <Search />
                            <Box
                                sx={{
                                    '& > a:after': {
                                        content: '""',
                                        display: 'block',
                                        position: 'absolute',
                                        width: 0,
                                        height: '2px',
                                        backgroundColor: grey[100],
                                        left: 0,
                                        bottom: 0,
                                        transition: 'all 0.3s linear',
                                    },
                                    display: 'flex',
                                    alignItems: 'center',
                                    '& > .active > span': {
                                        color: yellow[400],
                                        fontWeight: 700,
                                    },
                                    '& > .active:after': {
                                        backgroundColor: yellow[400],
                                    },
                                    ml: 5,
                                }}
                            >
                                <Box
                                    component={NavLink}
                                    to="/admin/users"
                                    sx={{
                                        textDecoration: 'none',
                                        color: grey[100],
                                        position: 'relative',
                                        '&:hover:after': {
                                            width: '100%',
                                        },
                                        fontFamily: 'Roboto',
                                    }}
                                    exact
                                >
                                    <Typography component="span" variant="h5">
                                        USERS
                                    </Typography>
                                </Box>
                                <Box
                                    component={NavLink}
                                    to="/admin/posts-management"
                                    sx={{
                                        textDecoration: 'none',
                                        color: grey[100],
                                        position: 'relative',
                                        '&:hover:after': {
                                            width: '100%',
                                        },
                                        ml: 5,
                                        fontFamily: 'Roboto',
                                    }}
                                >
                                    <Typography component="span" variant="h5">
                                        RECIPES
                                    </Typography>
                                </Box>
                            </Box>
                        </Box>
                        <Box display="flex" alignItems="center">
                            <Button
                                sx={{
                                    color: '#fefefe',
                                    border: '1px solid #fefefe',
                                    ml: 1,
                                    borderRadius: 2.5,
                                    pr: 6,
                                    justifyContent: 'flex-start',
                                }}
                                component={Link}
                                to="/login"
                            >
                                <IconButton aria-label="delete" size="large" sx={{ p: 0 }}>
                                    <AccountCircle fontSize="inherit" sx={{ color: '#fefefe' }} />
                                </IconButton>
                                <Typography ml={1}> LOGIN</Typography>
                            </Button>
                        </Box>
                    </Box>
                </Toolbar>
            </Container>
        </AppBar>
    )
}

export default AdminHeader
