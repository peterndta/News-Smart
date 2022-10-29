import React from 'react'

import { Link as RouterLink } from 'react-router-dom'

import { Box, Grid, Link, Rating, Typography, Checkbox } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const label = { inputProps: { 'aria-label': 'Checkbox demo' } }

const PostListCompo = ({ name, description, rating, imageUrl, id, selectHandler, options }) => {
    return (
        <Grid item md={12} mt={1}>
            <Box display="flex" pt={3} mt={2} sx={{ borderTop: `1px solid ${blueGrey[200]}` }}>
                <Checkbox
                    edge="start"
                    {...label}
                    value={id}
                    onChange={() => selectHandler(id)}
                    checked={options.indexOf(id) !== -1}
                />
                <Box display="flex" width="100%">
                    <RouterLink to={`${window.location.pathname}/${id}`}>
                        <Box
                            component="img"
                            width={120}
                            height={120}
                            sx={{ aspectRatio: '1 / 1' }}
                            src={imageUrl}
                        />
                    </RouterLink>
                    <Box display="flex" flexDirection="column" sx={{ ml: 2.5 }} width="100%">
                        <Box display="flex" alignItems="center" justifyContent="space-between">
                            <Link
                                href={`${window.location.pathname}/${id}`}
                                underline="hover"
                                variant="h5"
                                fontWeight={700}
                                sx={{ color: blueGrey[700] }}
                            >
                                {name}
                            </Link>
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

export default PostListCompo
