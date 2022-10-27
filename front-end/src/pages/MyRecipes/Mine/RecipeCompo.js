import React from 'react'

import { useHistory } from 'react-router-dom'

import { Delete, Edit } from '@mui/icons-material'
import { Box, Grid, IconButton, Rating, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import ConfirmPopup from './ConfirmPopup'

const RecipeCompo = ({ name, description, averageRating, imageUrl, id, deleteRecipeHandler }) => {
    const history = useHistory()
    const [openConfirm, setOpenConfirm] = React.useState(false)
    const handleOpenConfirm = () => {
        setOpenConfirm(true)
    }
    return (
        <Grid item md={12} mt={1}>
            {openConfirm && (
                <ConfirmPopup
                    postId={id}
                    deleteRecipeHandler={deleteRecipeHandler}
                    status={openConfirm}
                    onClose={() => setOpenConfirm(false)}
                />
            )}
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
                    <Box display="flex" flexDirection="column" sx={{ ml: 2.5 }} width="100%">
                        <Box display="flex" alignItems="center" justifyContent="space-between">
                            <Typography variant="h5" fontWeight={700} sx={{ color: blueGrey[700] }}>
                                {name}
                            </Typography>
                            <Box>
                                <IconButton
                                    component="label"
                                    size="large"
                                    onClick={() => history.push(`/recipes/${id}/update`)}
                                >
                                    <Edit color="warning" />
                                </IconButton>
                                <IconButton
                                    component="label"
                                    size="large"
                                    // onClick={() => deleteRecipeHandler(id)}
                                    onClick={handleOpenConfirm}
                                >
                                    <Delete />
                                </IconButton>
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
