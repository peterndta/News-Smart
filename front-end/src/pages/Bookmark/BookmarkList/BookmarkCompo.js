import React from 'react'

import { Box, Grid, Rating, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const BookmarkCompo = () => {
    return (
        <Grid item md={12} mt={1}>
            <Box pt={3} sx={{ borderTop: `1px solid ${blueGrey[200]}` }}>
                <Box display="flex">
                    <Box
                        component="img"
                        width={120}
                        height={120}
                        sx={{ aspectRatio: '1 / 1', objectFit: 'cover' }}
                        src="https://loveincorporated.blob.core.windows.net/contentimages/gallery/d9e900e4-212e-4c3d-96d5-cb14a023c659-worlds-most-delicious-dishes.jpg"
                    />
                    <Box display="flex" flexDirection="column" sx={{ ml: 2.5 }}>
                        <Typography variant="h5" fontWeight={700}>
                            World&apos; Best Lasagna
                        </Typography>
                        <Rating
                            name="half-rating"
                            defaultValue={2.5}
                            precision={0.5}
                            sx={{ mt: 1 }}
                        />
                        <Typography paragraph sx={{ mt: 1 }}>
                            Delicious, savory, and visually enticing chicken and broccoli stir-fry
                            recipe!... Delicious, savory, and visually enticing chicken and broccoli
                            stir-fry recipe!...
                        </Typography>
                    </Box>
                </Box>
            </Box>
        </Grid>
    )
}

export default BookmarkCompo
