import React from 'react'

import { Box, Grid, Rating, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const RecipeCompo = ({ name, description, rating, image }) => {
    return (
        <Grid item md={12} mt={1}>
            <Box pt={3} mt={2} sx={{ borderTop: `1px solid ${blueGrey[200]}` }}>
                <Box display="flex">
                    <Box
                        component="img"
                        width={120}
                        height={120}
                        sx={{ aspectRatio: '1 / 1' }}
                        src={image}
                    />
                    <Box display="flex" flexDirection="column" sx={{ ml: 2.5 }} width="100%">
                        <Box display="flex" alignItems="center" justifyContent="space-between">
                            <Typography variant="h5" fontWeight={700} sx={{ color: blueGrey[700] }}>
                                {name}
                            </Typography>
                        </Box>
                        <Rating
                            name="half-rating"
                            value={rating}
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

export default RecipeCompo
