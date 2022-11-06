import React from 'react'

import { Avatar, Box, Divider, Grid, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

const LatestAccounts = () => {
    return (
        <React.Fragment>
            <Box p={2}>
                <Typography
                    fontWeight={700}
                    sx={{
                        color: grey[600],
                    }}
                    fontSize="1.1rem"
                >
                    Latest Accounts
                </Typography>
                <Divider sx={{ mt: 1 }} />
                <Grid
                    container
                    spacing={3}
                    mt={1}
                    alignItems="center"
                    justifyContent="space-between"
                >
                    <Grid item xs={4} md={4} lg={2}>
                        <Avatar
                            alt="avatar"
                            src="https://cdn-icons-png.flaticon.com/512/147/147142.png"
                            sx={{ width: 50, height: 50 }}
                        />
                    </Grid>
                    <Grid item xs={4} md={4} lg={10}>
                        <Typography variant="body1" fontWeight={700}>
                            Nguyen Dang Truong Anh (K15HCM)
                        </Typography>
                    </Grid>
                </Grid>
                <Grid
                    container
                    spacing={3}
                    mt={1}
                    alignItems="center"
                    justifyContent="space-between"
                >
                    <Grid item xs={4} md={4} lg={2}>
                        <Avatar
                            alt="avatar"
                            src="https://cdn-icons-png.flaticon.com/512/147/147142.png"
                            sx={{ width: 50, height: 50 }}
                        />
                    </Grid>
                    <Grid item xs={4} md={4} lg={10}>
                        <Typography variant="body1" fontWeight={700}>
                            Nguyen Dang Truong Anh (K15HCM)
                        </Typography>
                    </Grid>
                </Grid>
                <Grid
                    container
                    spacing={3}
                    mt={1}
                    alignItems="center"
                    justifyContent="space-between"
                >
                    <Grid item xs={4} md={4} lg={2}>
                        <Avatar
                            alt="avatar"
                            src="https://cdn-icons-png.flaticon.com/512/147/147142.png"
                            sx={{ width: 50, height: 50 }}
                        />
                    </Grid>
                    <Grid item xs={4} md={4} lg={10}>
                        <Typography variant="body1" fontWeight={700}>
                            Nguyen Dang Truong Anh (K15HCM)
                        </Typography>
                    </Grid>
                </Grid>
                <Grid
                    container
                    spacing={3}
                    mt={1}
                    alignItems="center"
                    justifyContent="space-between"
                >
                    <Grid item xs={4} md={4} lg={2}>
                        <Avatar
                            alt="avatar"
                            src="https://cdn-icons-png.flaticon.com/512/147/147142.png"
                            sx={{ width: 50, height: 50 }}
                        />
                    </Grid>
                    <Grid item xs={4} md={4} lg={10}>
                        <Typography variant="body1" fontWeight={700}>
                            Nguyen Dang Truong Anh (K15HCM)
                        </Typography>
                    </Grid>
                </Grid>
                <Grid
                    container
                    spacing={3}
                    mt={1}
                    alignItems="center"
                    justifyContent="space-between"
                >
                    <Grid item xs={4} md={4} lg={2}>
                        <Avatar
                            alt="avatar"
                            src="https://cdn-icons-png.flaticon.com/512/147/147142.png"
                            sx={{ width: 50, height: 50 }}
                        />
                    </Grid>
                    <Grid item xs={4} md={4} lg={10}>
                        <Typography variant="body1" fontWeight={700}>
                            Nguyen Dang Truong Anh (K15HCM)
                        </Typography>
                    </Grid>
                </Grid>
                <Grid
                    container
                    spacing={3}
                    mt={1}
                    alignItems="center"
                    justifyContent="space-between"
                >
                    <Grid item xs={4} md={4} lg={2}>
                        <Avatar
                            alt="avatar"
                            src="https://cdn-icons-png.flaticon.com/512/147/147142.png"
                            sx={{ width: 50, height: 50 }}
                        />
                    </Grid>
                    <Grid item xs={4} md={4} lg={10}>
                        <Typography variant="body1" fontWeight={700}>
                            Nguyen Dang Truong Anh (K15HCM)
                        </Typography>
                    </Grid>
                </Grid>
                <Grid
                    container
                    spacing={3}
                    mt={1}
                    alignItems="center"
                    justifyContent="space-between"
                >
                    <Grid item xs={4} md={4} lg={2}>
                        <Avatar
                            alt="avatar"
                            src="https://cdn-icons-png.flaticon.com/512/147/147142.png"
                            sx={{ width: 50, height: 50 }}
                        />
                    </Grid>
                    <Grid item xs={4} md={4} lg={10}>
                        <Typography variant="body1" fontWeight={700}>
                            Nguyen Dang Truong Anh (K15HCM)
                        </Typography>
                    </Grid>
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default LatestAccounts
