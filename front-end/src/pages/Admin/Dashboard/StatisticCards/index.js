import { Fragment } from 'react'

import { Description, Group, Bookmark, Flag } from '@mui/icons-material'
import { Box, Grid, Paper, Typography } from '@mui/material'
import { grey, blueGrey } from '@mui/material/colors'

const StatisticCards = ({ statis }) => {
    return (
        <Fragment>
            <Grid container spacing={3}>
                <Grid item xs={12} md={6} lg={3}>
                    <Paper elevation={3} sx={{ borderRadius: 4 }}>
                        <Box
                            display="flex"
                            alignItems="center"
                            justifyContent="space-between"
                            width="100%"
                        >
                            <Grid item xs={8}>
                                <Box p={2}>
                                    <Typography
                                        fontWeight={700}
                                        sx={{
                                            color: grey[600],
                                        }}
                                        fontSize="1.1rem"
                                    >
                                        Total Posts
                                    </Typography>
                                    <Typography
                                        fontWeight={700}
                                        sx={{
                                            color: blueGrey[800],
                                        }}
                                        fontSize="1.6rem"
                                    >
                                        {statis.totalPosts}
                                    </Typography>
                                </Box>
                            </Grid>
                            <Grid item xs={4}>
                                <Box
                                    display="flex"
                                    ml={2}
                                    sx={{
                                        background:
                                            'linear-gradient(191deg, rgb(66, 66, 74), rgb(25, 25, 25))',
                                        borderRadius: 2,
                                    }}
                                    width="3.5rem"
                                    height="3.5rem"
                                    borderRadius="md"
                                    justifyContent="center"
                                    alignItems="center"
                                    shadow="md"
                                >
                                    <Description fontSize="medium" sx={{ color: '#ffffff' }} />
                                </Box>
                            </Grid>
                        </Box>
                    </Paper>
                </Grid>
                <Grid item xs={12} md={6} lg={3}>
                    <Paper elevation={3} sx={{ borderRadius: 4 }}>
                        <Box
                            display="flex"
                            alignItems="center"
                            justifyContent="space-between"
                            width="100%"
                        >
                            <Grid item xs={8}>
                                <Box p={2}>
                                    <Typography
                                        fontWeight={700}
                                        sx={{
                                            color: grey[600],
                                        }}
                                        fontSize="1.1rem"
                                    >
                                        Total Accounts
                                    </Typography>
                                    <Typography
                                        fontWeight={700}
                                        sx={{
                                            color: blueGrey[800],
                                        }}
                                        fontSize="1.6rem"
                                    >
                                        {statis.totalAccounts}
                                    </Typography>
                                </Box>
                            </Grid>
                            <Grid item xs={4}>
                                <Box
                                    display="flex"
                                    ml={2}
                                    sx={{
                                        background:
                                            'linear-gradient(191deg, rgb(73, 163, 241), rgb(26, 115, 232))',
                                        borderRadius: 2,
                                    }}
                                    width="3.5rem"
                                    height="3.5rem"
                                    borderRadius="md"
                                    justifyContent="center"
                                    alignItems="center"
                                    shadow="md"
                                >
                                    <Group fontSize="medium" sx={{ color: '#ffffff' }} />
                                </Box>
                            </Grid>
                        </Box>
                    </Paper>
                </Grid>
                <Grid item xs={12} md={6} lg={3}>
                    <Paper elevation={3} sx={{ borderRadius: 4 }}>
                        <Box
                            display="flex"
                            alignItems="center"
                            justifyContent="space-between"
                            width="100%"
                        >
                            <Grid item xs={8}>
                                <Box p={2}>
                                    <Typography
                                        fontWeight={700}
                                        sx={{
                                            color: grey[600],
                                        }}
                                        fontSize="1.1rem"
                                    >
                                        Total Bookmarked
                                    </Typography>
                                    <Typography
                                        fontWeight={700}
                                        sx={{
                                            color: blueGrey[800],
                                        }}
                                        fontSize="1.6rem"
                                    >
                                        {statis.totalBookmark}
                                    </Typography>
                                </Box>
                            </Grid>
                            <Grid item xs={4}>
                                <Box
                                    display="flex"
                                    ml={2}
                                    sx={{
                                        background:
                                            'linear-gradient(191deg, rgb(102, 187, 106), rgb(67, 160, 71))',
                                        borderRadius: 2,
                                    }}
                                    width="3.5rem"
                                    height="3.5rem"
                                    borderRadius="md"
                                    justifyContent="center"
                                    alignItems="center"
                                    shadow="md"
                                >
                                    <Bookmark fontSize="medium" sx={{ color: '#ffffff' }} />
                                </Box>
                            </Grid>
                        </Box>
                    </Paper>
                </Grid>
                <Grid item xs={12} md={6} lg={3}>
                    <Paper elevation={3} sx={{ borderRadius: 4 }}>
                        <Box
                            display="flex"
                            alignItems="center"
                            justifyContent="space-between"
                            width="100%"
                        >
                            <Grid item xs={8}>
                                <Box p={2}>
                                    <Typography
                                        fontWeight={700}
                                        sx={{
                                            color: grey[600],
                                        }}
                                        fontSize="1.1rem"
                                    >
                                        Total Reports
                                    </Typography>
                                    <Typography
                                        fontWeight={700}
                                        sx={{
                                            color: blueGrey[800],
                                        }}
                                        fontSize="1.6rem"
                                    >
                                        {statis.totalReport}
                                    </Typography>
                                </Box>
                            </Grid>
                            <Grid item xs={4}>
                                <Box
                                    display="flex"
                                    ml={2}
                                    sx={{
                                        background:
                                            'linear-gradient(191deg, rgb(236, 64, 122), rgb(216, 27, 96))',
                                        borderRadius: 2,
                                    }}
                                    width="3.5rem"
                                    height="3.5rem"
                                    borderRadius="md"
                                    justifyContent="center"
                                    alignItems="center"
                                    shadow="md"
                                >
                                    <Flag fontSize="medium" sx={{ color: '#ffffff' }} />
                                </Box>
                            </Grid>
                        </Box>
                    </Paper>
                </Grid>
            </Grid>
            <Box mt={4.5}></Box>
        </Fragment>
    )
}

export default StatisticCards
