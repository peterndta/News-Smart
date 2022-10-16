import React, { useState } from 'react'

import { Link, NavLink } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import { AccountCircle, Add, Logout } from '@mui/icons-material'
import {
    AppBar,
    Avatar,
    Box,
    Button,
    Chip,
    Container,
    Divider,
    IconButton,
    ListItemIcon,
    Menu,
    MenuItem,
    Toolbar,
    Tooltip,
    Typography,
} from '@mui/material'
import { grey, yellow } from '@mui/material/colors'

import logo from '../../../assets/images/logo.png'
import { useAuthAction } from '../../../recoil/auth'
import authAtom from '../../../recoil/auth/atom'
import CreateType from '../../CreateType'
import Search from '../../Search'

const AdminHeader = () => {
    const auth = useRecoilValue(authAtom)
    const [anchorEl, setAnchorEl] = useState(null)
    const open = Boolean(anchorEl)
    const authAction = useAuthAction()
    const [openDialog, setOpenDialog] = React.useState(false)

    const openDialogHandler = () => {
        setOpenDialog(true)
    }

    const closeDialogHandler = () => {
        setOpenDialog(false)
    }

    const handleClick = (event) => {
        setAnchorEl(event.currentTarget)
    }
    const handleClose = () => {
        setAnchorEl(null)
    }
    const handleClickLogout = () => {
        authAction.logout()
    }

    return (
        <React.Fragment>
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
                                    <Link to="/admin/users">
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
                                    <Box
                                        component={NavLink}
                                        to="/admin/reports"
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
                                            REPORTS
                                        </Typography>
                                    </Box>
                                    <Box
                                        component={NavLink}
                                        to="/admin/collection"
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
                                            COLLECTION
                                        </Typography>
                                    </Box>
                                </Box>
                            </Box>
                            {auth.email ? (
                                <React.Fragment>
                                    <Tooltip title="Account settings">
                                        <IconButton onClick={handleClick} size="large">
                                            <Avatar
                                                src={auth.image}
                                                sx={{ width: 40, height: 40 }}
                                            />
                                        </IconButton>
                                    </Tooltip>

                                    <Menu
                                        anchorEl={anchorEl}
                                        id="account-menu"
                                        open={open}
                                        onClose={handleClose}
                                        onClick={handleClose}
                                        PaperProps={{
                                            elevation: 0,
                                            sx: {
                                                overflow: 'visible',
                                                filter: 'drop-shadow(0px 2px 8px rgba(0,0,0,0.32))',
                                                mt: 1,
                                                px: 3,
                                                pt: 3,
                                                pb: 1,
                                                '&:before': {
                                                    content: '""',
                                                    display: 'block',
                                                    position: 'absolute',
                                                    top: 0,
                                                    right: 14,
                                                    width: 10,
                                                    height: 10,
                                                    bgcolor: 'background.paper',
                                                    transform: 'translateY(-50%) rotate(45deg)',
                                                    zIndex: 0,
                                                },
                                            },
                                        }}
                                        transformOrigin={{ horizontal: 'right', vertical: 'top' }}
                                        anchorOrigin={{ horizontal: 'right', vertical: 'bottom' }}
                                    >
                                        <Box
                                            component="li"
                                            display="flex"
                                            flexDirection="column"
                                            alignItems="center"
                                            mb={1}
                                        >
                                            <Avatar
                                                alt="avatar"
                                                src={auth.image}
                                                sx={{ width: 80, height: 80, mb: 2 }}
                                            />
                                            <Typography
                                                variant="body1"
                                                fontWeight={700}
                                                textAlign="center"
                                            >
                                                {auth.name}
                                            </Typography>
                                            <Typography variant="body1" textAlign="center">
                                                {auth.email}
                                            </Typography>
                                            <Divider
                                                textAlign="center"
                                                sx={{ width: '100%', mt: 2 }}
                                            >
                                                <Chip label={auth.role} />
                                            </Divider>
                                        </Box>
                                        <MenuItem
                                            sx={{ display: 'flex', pr: 5 }}
                                            onClick={openDialogHandler}
                                        >
                                            <ListItemIcon>
                                                <Add fontSize="large" />
                                            </ListItemIcon>
                                            <Typography ml={1}>Create Type</Typography>
                                        </MenuItem>
                                        <MenuItem
                                            sx={{ display: 'flex', pr: 5 }}
                                            onClick={handleClickLogout}
                                        >
                                            <ListItemIcon>
                                                <Logout fontSize="large" />
                                            </ListItemIcon>
                                            <Typography ml={1}>Logout</Typography>
                                        </MenuItem>
                                    </Menu>
                                </React.Fragment>
                            ) : (
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
                                        <AccountCircle
                                            fontSize="inherit"
                                            sx={{ color: '#fefefe' }}
                                        />
                                    </IconButton>
                                    <Typography ml={1}> LOGIN</Typography>
                                </Button>
                            )}
                        </Box>
                    </Toolbar>
                </Container>
            </AppBar>
            {openDialog && <CreateType status={openDialog} onClose={closeDialogHandler} />}
        </React.Fragment>
    )
}

export default AdminHeader
