import React from 'react'

import { Box, Grid, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import SearchBox from './Search'
import StickyHeadTable from './Table'

const UserManagement = () => {
    return (
        <Box mt={4} mb={11}>
            <Grid mb={5} container columnSpacing={4}>
                <Grid mt={6} item md={8}>
                    <Typography variant="h3" fontWeight={700} sx={{ color: blueGrey[800] }}>
                        User Management
                    </Typography>
                </Grid>
                <Grid mt={6} item md={4}>
                    <SearchBox />
                </Grid>
                {/* <Grid mt={4} item md={2}>
                    <Sort />
                </Grid> */}
            </Grid>
            <StickyHeadTable />
        </Box>
    )
}

export default UserManagement
