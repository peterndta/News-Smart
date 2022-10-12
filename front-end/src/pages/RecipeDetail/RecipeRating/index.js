import React from 'react'

import { Star } from '@mui/icons-material'
import { Box, Modal, Rating, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import { useSnackbar } from '../../../HOCs/SnackbarContext'
import { useRating } from '../../../recoil/rating'

const labels = {
    1: 'Useless',
    2: 'Poor',
    3: 'Ok',
    4: 'Good',
    5: 'Excellent',
}

const RecipeRating = ({ open, onClose, postId }) => {
    const ratingAction = useRating()
    const [hover, setHover] = React.useState(-1)
    const showSnackbar = useSnackbar()

    const ratingChangeHandler = (newValue) => {
        console.log(newValue)
        ratingAction
            .createRating(postId, { rating: newValue })
            .then((res) => {
                console.log(res.data.data)
            })
            .catch((error) => {
                console.log(error.response)
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
            })
    }

    return (
        <Modal open={open} onClose={onClose}>
            <Box
                sx={{
                    position: 'absolute',
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    bgcolor: 'background.paper',
                    borderRadius: 4,
                    overflow: 'hidden',
                    boxShadow: 24,
                }}
            >
                <Box sx={{ py: 3, px: 3, bgcolor: 'primary.main', color: grey[100] }}>
                    <Typography variant="h5">How do you feel about the Recipe?</Typography>
                </Box>
                <Box sx={{ py: 4, px: 3 }}>
                    <Box>
                        <Typography
                            fontWeight={700}
                            sx={{ color: blueGrey[900], mb: 0.5, ml: 0.5 }}
                        >
                            Rate this Recipe
                        </Typography>
                        <Box display="flex" alignItems="center">
                            <Rating
                                onChange={(_, newValue) => ratingChangeHandler(newValue)}
                                sx={{ mr: 1 }}
                                onChangeActive={(event, newHover) => {
                                    setHover(newHover)
                                }}
                                emptyIcon={<Star style={{ opacity: 0.55 }} fontSize="inherit" />}
                            />
                            <Box sx={{ ml: 2 }}>{labels[hover]}</Box>
                        </Box>
                    </Box>
                </Box>
            </Box>
        </Modal>
    )
}

export default RecipeRating
