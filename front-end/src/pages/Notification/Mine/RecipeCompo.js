import React from 'react'

import { useHistory } from 'react-router-dom'

import { Box, Divider, Grid, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const RecipeCompo = ({ name, imageUrl, id, index }) => {
    const history = useHistory()
    console.log(index)
    return (
        <Grid item md={12} mt={1}>
            <Box mt={2} sx={{ backgroundColor: index % 2 ? '#F2F2F2' : '#F6EEE4' }}>
                <Box display="flex" alignItems="center">
                    <Divider
                        orientation="vertical"
                        flexItem
                        sx={{
                            borderRightWidth: '3.5px',
                            backgroundColor: (theme) => theme.palette.primary.main,
                        }}
                    />
                    <Box
                        ml={1}
                        component="img"
                        width={120}
                        height={120}
                        sx={{ aspectRatio: '1 / 1', cursor: 'pointer' }}
                        src={imageUrl}
                        onClick={() => history.push(`/recipes/${id}`)}
                    />
                    <Box display="flex" flexDirection="column" sx={{ ml: 2.5 }} width="100%">
                        <Box display="flex" alignItems="center">
                            <Typography fontWeight={700} sx={{ fontSize: 18 }}>
                                {name}
                            </Typography>
                            <Typography ml={1} sx={{ color: blueGrey[700], fontSize: 18 }}>
                                is removed by admin
                            </Typography>
                        </Box>
                        <Typography
                            paragraph
                            sx={{
                                mt: 1,
                                overflow: 'hidden',
                                display: '-webkit-box',
                                WebkitBoxOrient: 'vertical',
                                WebkitLineClamp: '2',
                                textOverflow: 'ellipsis',
                                fontSize: 20,
                                color: blueGrey[700],
                            }}
                        >
                            This post is removed due to: “
                            {'Violates community standards and racism'}”.
                        </Typography>
                        <Typography
                            sx={{
                                fontSize: 14,
                                color: blueGrey[700],
                            }}
                        >
                            Reported 10 mins ago
                        </Typography>
                    </Box>
                </Box>
            </Box>
        </Grid>
    )
}

export default RecipeCompo
