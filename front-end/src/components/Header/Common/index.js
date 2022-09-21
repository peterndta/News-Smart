import React from 'react'

import { NavLink, Link } from 'react-router-dom'

import AccountCircleIcon from '@mui/icons-material/AccountCircle'
import BookmarkBorderIcon from '@mui/icons-material/BookmarkBorder'
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
import Filter from './Filter'
import Search from './Search'

const filters = [
    {
        key: 1,
        title: 'COURSE',
        list: ['Main Dish', 'Side Dish', 'Snack', 'Appetizer', 'Breakfast'],
    },
    {
        key: 2,
        title: 'INGREDIENT',
        list: ['Beef', 'Chicken', 'Egg', 'Seafood', 'Pork'],
    },
    {
        key: 3,
        title: 'METHODS',
        list: ['Boil', 'Fry', 'Roast'],
    },
]

const CommonHeader = () => {
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
                                <Link to="/">
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
                                    to="/"
                                    sx={{
                                        textDecoration: 'none',
                                        color: grey[100],
                                        position: 'relative',
                                        pb: 0.5,
                                        '&:hover:after': {
                                            width: '100%',
                                        },
                                        fontFamily: 'Roboto',
                                    }}
                                    exact
                                >
                                    <Typography component="span" variant="h5">
                                        HOME
                                    </Typography>
                                </Box>
                                <Box
                                    component={NavLink}
                                    to="/recipes"
                                    sx={{
                                        textDecoration: 'none',
                                        color: grey[100],
                                        position: 'relative',
                                        pb: 0.5,
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
                            <Filter filters={filters} />
                            <Box component={Link} to="/bookmark" sx={{ textDecoration: ' none' }}>
                                <IconButton component="label" size="large" sx={{ ml: 3 }}>
                                    <BookmarkBorderIcon
                                        fontSize="large"
                                        sx={{ color: '#fefefe' }}
                                    />
                                </IconButton>
                            </Box>
                            <Button
                                sx={{
                                    color: '#fefefe',
                                    border: '1px solid #fefefe',
                                    ml: 2,
                                    borderRadius: 2.5,
                                    pr: 6,
                                    justifyContent: 'flex-start',
                                }}
                            >
                                <IconButton aria-label="delete" size="large" sx={{ p: 0 }}>
                                    <AccountCircleIcon
                                        fontSize="inherit"
                                        sx={{ color: '#fefefe' }}
                                    />
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

export default CommonHeader
