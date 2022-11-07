import React from 'react'

import { useHistory } from 'react-router-dom'

import { Avatar, Box, Divider, Grid, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const LatestAccounts = ({ statis }) => {
    const history = useHistory()
    return (
        <React.Fragment>
            <Box p={2}>
                <Typography
                    p={1}
                    fontWeight={700}
                    sx={{
                        color: blueGrey[800],
                        fontSize: 22,
                    }}
                >
                    Top 6 Posts with Highest Rating
                </Typography>
                <Grid
                    pt={2}
                    pl={2}
                    pb={1}
                    container
                    spacing={3}
                    alignItems="center"
                    justifyContent="space-between"
                >
                    <Grid item xs={4} md={4} lg={3}>
                        <Typography variant="body1" fontWeight={700} textAlign="center">
                            Create Date
                        </Typography>
                    </Grid>
                    <Grid item xs={4} md={4} lg={2}></Grid>
                    <Grid item xs={4} md={4} lg={5}>
                        <Typography variant="body1" fontWeight={700}>
                            Post’s name
                        </Typography>
                    </Grid>
                    <Grid item xs={4} md={4} lg={2}>
                        <Typography variant="body1" fontWeight={700}>
                            Rated
                        </Typography>
                    </Grid>
                </Grid>
                <Divider
                    sx={{
                        background: (theme) => theme.palette.primary.main,
                        height: 1.25,
                    }}
                />
                {statis.postsWithHighRating.map((data) => (
                    <Grid
                        key={data.id}
                        pl={2}
                        pb={1}
                        pt={2}
                        container
                        spacing={3}
                        alignItems="center"
                        justifyContent="space-between"
                    >
                        <Grid item xs={4} md={4} lg={3}>
                            <Typography>{data.createDate.substring(0, 10)}</Typography>
                            <Typography>
                                {data.createDate.substring(11, 16)}{' '}
                                {parseInt(data.createDate.substring(11, 13)) > 12 ? 'pm' : 'am'}
                            </Typography>
                        </Grid>
                        <Grid item xs={4} md={4} lg={2}>
                            <Avatar
                                variant="square"
                                alt="avatar"
                                src={data.imageUrl}
                                sx={{ width: 65, height: 65, cursor: 'pointer' }}
                                onClick={() => history.push(`/admin/posts-management/${data.id}`)}
                            />
                        </Grid>
                        <Grid item xs={4} md={4} lg={5}>
                            <Typography
                                variant="body1"
                                fontWeight={450}
                                sx={{ cursor: 'pointer' }}
                                onClick={() => history.push(`/admin/posts-management/${data.id}`)}
                            >
                                {data.name}
                            </Typography>
                        </Grid>
                        <Grid item xs={4} md={4} lg={2}>
                            <Typography variant="body1">{data.averageRating}</Typography>
                        </Grid>
                    </Grid>
                ))}
            </Box>
        </React.Fragment>
    )
}

export default LatestAccounts
