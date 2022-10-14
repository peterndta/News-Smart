import React from 'react'

import { useHistory } from 'react-router-dom'

import { Box, Grid, Rating, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const RatingCompo = ({ name, description, imageUrl, averageRating, id }) => {
    const history = useHistory()

    return (
        <Grid item md={12} mt={1}>
            <Box pt={3} mt={2} sx={{ borderTop: `1px solid ${blueGrey[200]}` }}>
                <Box display="flex">
                    <Box
                        component="img"
                        width={120}
                        height={120}
                        sx={{ aspectRatio: '1 / 1', cursor: 'pointer' }}
                        src={imageUrl}
                        onClick={() => history.push(`/recipes/${id}`)}
                    />
                    <Box display="flex" flexDirection="column" sx={{ ml: 2.5 }}>
                        <Typography variant="h5" fontWeight={700} sx={{ color: blueGrey[700] }}>
                            {name}
                        </Typography>
                        <Rating
                            name="half-rating"
                            value={averageRating}
                            precision={0.5}
                            sx={{ mt: 1 }}
                            readOnly
                        />
                        <Typography
                            paragraph
                            sx={{
                                mt: 1,
                                overflow: 'hidden',
                                display: '-webkit-box',
                                WebkitBoxOrient: 'vertical',
                                WebkitLineClamp: '2',
                                textOverflow: 'ellipsis',
                            }}
                        >
                            {description}
                        </Typography>
                    </Box>
                </Box>
            </Box>
        </Grid>
    )
}

export default RatingCompo
