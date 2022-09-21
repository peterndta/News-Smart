import React, { useEffect, useState } from 'react'

import { Link } from 'react-router-dom'

import GroupIcon from '@mui/icons-material/Group'
import LocalPhoneIcon from '@mui/icons-material/LocalPhone'
import NorthRoundedIcon from '@mui/icons-material/NorthRounded'
import PhoneIphoneIcon from '@mui/icons-material/PhoneIphone'
import { Avatar, Box, Container, Stack, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import logo from '../../assets/images/logo.png'

const Footer = () => {
    const [showTopBtn, setShowTopBtn] = useState(false)
    useEffect(() => {
        window.onscroll = () => {
            if (window.scrollY > 400) {
                setShowTopBtn(true)
            } else {
                setShowTopBtn(false)
            }
        }
        return () => {
            window.onscroll = null
        }
    }, [])
    const goToTop = () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth',
        })
    }
    return (
        <Box sx={{ backgroundColor: grey[800] }} py={8}>
            <Container maxWidth="xl">
                <Box display="flex" alignItems="center" justifyContent="center">
                    <Stack
                        direction={{ xs: 'column', sm: 'row' }}
                        spacing={{ xs: 1, sm: 2, md: 10 }}
                        alignItems="center"
                    >
                        <Avatar sx={{ height: 80, width: 150 }} src={logo} alt="logo"></Avatar>
                        <Box sx={{ color: '#fefefe' }} display="flex" alignItems="center">
                            <GroupIcon fontSize="large" />
                            <Typography
                                component={Link}
                                to="/about"
                                sx={{
                                    color: '#fefefe',
                                    textDecoration: 'none',
                                    ml: 1,
                                    fontWeight: 700,
                                }}
                                variant="h5"
                            >
                                About Us
                            </Typography>
                        </Box>
                        <Box sx={{ color: '#fefefe' }} display="flex" alignItems="center">
                            <LocalPhoneIcon fontSize="large" />
                            <Typography
                                component={Link}
                                to="/contact"
                                sx={{
                                    color: '#fefefe',
                                    textDecoration: 'none',
                                    ml: 1,
                                    fontWeight: 700,
                                }}
                                variant="h5"
                            >
                                Contact Us
                            </Typography>
                        </Box>
                        <Box sx={{ color: '#fefefe' }} display="flex" alignItems="center">
                            <PhoneIphoneIcon fontSize="large" />
                            <Typography
                                component={Link}
                                to="/getapp"
                                sx={{
                                    color: '#fefefe',
                                    textDecoration: 'none',
                                    ml: 1,
                                    fontWeight: 700,
                                }}
                                variant="h5"
                            >
                                Get App
                            </Typography>
                        </Box>
                        {showTopBtn && (
                            <Box
                                onClick={goToTop}
                                display="flex"
                                alignItems="center"
                                sx={{ color: '#fefefe', cursor: 'pointer' }}
                            >
                                <NorthRoundedIcon fontSize="large" />
                                <Typography sx={{ ml: 1, fontWeight: 700 }} variant="h5">
                                    Back To Top
                                </Typography>
                            </Box>
                        )}
                    </Stack>
                </Box>
            </Container>
        </Box>
    )
}

export default Footer
