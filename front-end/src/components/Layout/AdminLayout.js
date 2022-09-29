import React from 'react'

import { Box, Container } from '@mui/material'

import Footer from '../Footer'
import { AdminHeader } from '../Header'

const AdminLayout = ({ children }) => {
    return (
        <React.Fragment>
            <AdminHeader />
            <Box minHeight="50vh">
                <Container maxWidth="lg"> {children}</Container>
            </Box>
            <Footer />
        </React.Fragment>
    )
}

export default AdminLayout
