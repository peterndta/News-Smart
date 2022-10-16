import React from 'react'

import { Box, Grid, Rating, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

const RecipeCompo = ({ name, description, averageRating, userName, imageUrl }) => {
    return (
        <Grid item md={12} mt={1}>
            <Box mx={10} pt={4} mt={2} sx={{ borderTop: `1px solid ${blueGrey[200]}` }}>
                <Box display="flex" mx={3}>
                    <Box
                        component="img"
                        width={120}
                        height={120}
                        sx={{ aspectRatio: '1 / 1' }}
                        src={imageUrl}
                    />
                    <Box display="flex" flexDirection="column" sx={{ ml: 2.5, width: '1' }}>
                        <Box display="flex" alignItems="center" justifyContent="space-between">
                            <Typography variant="h5" fontWeight={700} sx={{ color: blueGrey[700] }}>
                                {name}
                            </Typography>
                            <Box>
                                <Typography component="span" sx={{ color: grey[500] }}>
                                    By
                                </Typography>
                                <Typography
                                    component="span"
                                    ml={1.5}
                                    variant="body2"
                                    fontWeight={700}
                                >
                                    {userName}
                                </Typography>
                            </Box>
                        </Box>
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

export default RecipeCompo
