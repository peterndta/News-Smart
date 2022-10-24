import React from 'react'

import { useHistory } from 'react-router-dom'

import { Box, Button, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import Loading from '../../pages/Loading'

const NotFound = ({ isLoading }) => {
    const history = useHistory()
    return isLoading ? (
        <Loading />
    ) : (
        <Box
            display="flex"
            alignItems="center"
            justifyContent="center"
            flexDirection="column"
            height="100vh"
        >
            <Typography variant="h4" fontWeight={700} sx={{ color: blueGrey[600] }}>
                Something went wrong, this recipe does not exist
            </Typography>
            <Button
                variant="contained"
                sx={{ mt: 2, color: grey[100] }}
                onClick={() => history.goBack()}
            >
                Go Back
            </Button>
        </Box>
    )
}

export default NotFound
