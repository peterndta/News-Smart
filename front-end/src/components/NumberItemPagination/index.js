import React from 'react'

import { Box, Typography } from '@mui/material'

const NumberItemPagination = ({ from, to, all }) => {
    return (
        <Box display="flex" mt={1.5}>
            <Typography component="span">
                Showing{' '}
                <Typography component="span" fontWeight={700}>
                    {' '}
                    {from}{' '}
                </Typography>
                to{' '}
                <Typography component="span" fontWeight={700}>
                    {' '}
                    {to}{' '}
                </Typography>
                of{' '}
                <Typography component="span" fontWeight={700}>
                    {' '}
                    {all}{' '}
                </Typography>
            </Typography>
        </Box>
    )
}

export default NumberItemPagination
