import React from 'react'

import { InfoRounded, CameraAlt } from '@mui/icons-material'
import {
    Box,
    Button,
    Chip,
    Container,
    Divider,
    FormControl,
    Grid,
    InputLabel,
    OutlinedInput,
    Paper,
    TextField,
    Typography,
} from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

const src = 'https://res.cloudinary.com/dq7l8216n/image/upload/v1642158763/FPTU.png'

const CreateRecipeForm = () => {
    return (
        <Container maxWidth="xl" sx={{ mt: 3 }}>
            <Grid container component={Paper} elevation={3}>
                <Grid md={12} item container>
                    <Grid item md={5}>
                        <Box display="flex" alignItems="center" height="100%">
                            <Box
                                component="img"
                                alt="school-image"
                                src={src}
                                sx={{
                                    width: '100%',
                                    aspectRatio: '1 / 1',
                                }}
                            />
                        </Box>
                    </Grid>
                    <Grid item md={7}>
                        <Box component="form" p={4} autoComplete="off">
                            <FormControl fullWidth>
                                <InputLabel htmlFor="component-outlined">Name of dish</InputLabel>
                                <OutlinedInput id="component-outlined" label="Name of dish" />
                            </FormControl>
                            <Box
                                sx={{
                                    my: 4,
                                    width: '100%',
                                    display: 'flex',
                                    alignItems: 'center',
                                }}
                            >
                                <InputLabel htmlFor="upload-photo" sx={{ display: 'inline-block' }}>
                                    <input
                                        required
                                        style={{ opacity: 0, maxWidth: 0.5 }}
                                        id="upload-photo"
                                        type="file"
                                        accept="image/*"
                                    />
                                    <Button
                                        variant="outlined"
                                        component="span"
                                        startIcon={<CameraAlt />}
                                    >
                                        Upload Poster
                                    </Button>
                                </InputLabel>
                                <Box display="flex" alignItems="center" sx={{ ml: 3 }}>
                                    <InfoRounded color="primary" fontSize="small" />
                                    <Typography sx={{ color: grey[800], ml: 0.5 }}>
                                        Recommend using image with ratio 1:1
                                    </Typography>
                                </Box>
                            </Box>
                            <FormControl fullWidth required>
                                <TextField
                                    label="Description"
                                    id="description"
                                    minRows={9}
                                    maxRows={9}
                                    multiline
                                />
                            </FormControl>
                        </Box>
                    </Grid>
                </Grid>
                <Divider
                    sx={{
                        backgroundColor: blueGrey[800],
                        width: '100%',
                        opacity: 0.5,
                    }}
                    light
                />
                <Grid item={12} container>
                    <Box p={4} width="1">
                        <Typography
                            variant="h4"
                            fontWeight={700}
                            sx={{ color: blueGrey[600], mb: 1 }}
                        >
                            Directions
                        </Typography>
                        <Chip label="Step 1: Preparation" color="primary" variant="outlined" />
                        <Grid container item my={3} columnSpacing={5}>
                            <Grid item md={6}>
                                <FormControl fullWidth required>
                                    <TextField
                                        label="Tools needed"
                                        id="Tools needed"
                                        minRows={5}
                                        maxRows={5}
                                        multiline
                                    />
                                </FormControl>
                            </Grid>
                            <Grid item md={6}>
                                <FormControl fullWidth required>
                                    <TextField
                                        label="Ingredients needed"
                                        id="Ingredients needed"
                                        minRows={5}
                                        maxRows={5}
                                        multiline
                                    />
                                </FormControl>
                            </Grid>
                        </Grid>
                        <Chip label="Step 2: Process" color="primary" variant="outlined" />
                        <FormControl fullWidth required sx={{ my: 3 }}>
                            <TextField
                                minRows={5}
                                maxRows={5}
                                multiline
                                placeholder="e.g. Combine all dry ingredients in a large bowl…"
                            />
                        </FormControl>
                        <Chip label="Step 3: Cooking" color="primary" variant="outlined" />
                        <FormControl fullWidth required sx={{ mt: 3 }}>
                            <TextField
                                minRows={5}
                                maxRows={5}
                                multiline
                                placeholder="e.g. Preheat oven to 350 degrees F…
"
                            />
                        </FormControl>
                    </Box>
                </Grid>
            </Grid>
        </Container>
    )
}

export default CreateRecipeForm