import React from 'react'

import { useHistory } from 'react-router-dom'

import { Box, Card, CardContent, CardMedia, Grid, Rating, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

const LatestRecipe = ({ post }) => {
    const history = useHistory()
    return (
        <Grid item md={4}>
            <Card sx={{ maxWidth: 392, height: '1' }}>
                <CardMedia
                    component="img"
                    alt="green iguana"
                    height="270"
                    image={post.imageUrl}
                    onClick={() => history.push(`/recipes/${post.id}`)}
                    sx={{ cursor: 'pointer' }}
                />
                <CardContent>
                    <Typography gutterBottom variant="h5" component="div" fontWeight={700}>
                        {post.name}
                    </Typography>
                    <Typography
                        variant="body1"
                        color="text.secondary"
                        sx={{
                            overflow: 'hidden',
                            display: '-webkit-box',
                            WebkitBoxOrient: 'vertical',
                            WebkitLineClamp: '2',
                            textOverflow: 'ellipsis',
                        }}
                    >
                        {post.description}
                    </Typography>
                    <Rating
                        name="half-rating-read"
                        value={post.averageRating}
                        precision={0.5}
                        readOnly
                        sx={{ mt: 2 }}
                    />
                    <Box mt={1}>
                        <Typography component="span" sx={{ color: grey[500] }}>
                            By
                        </Typography>
                        <Typography component="span" ml={1.5} variant="body2" fontWeight={700}>
                            {post.userName}
                        </Typography>
                    </Box>
                </CardContent>
            </Card>
        </Grid>
    )
}

export default LatestRecipe
