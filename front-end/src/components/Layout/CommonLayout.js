import React from 'react'

import { Box, Container } from '@mui/material'

import Footer from '../Footer'
import { CommonHeader } from '../Header'

const CommonLayout = ({ children }) => {
    return (
        <React.Fragment>
            <CommonHeader />
            <Box mt={8}>
                <Container maxWidth="lg"> {children}</Container>
            </Box>
            <Footer />
        </React.Fragment>
    )
}

export default CommonLayout
