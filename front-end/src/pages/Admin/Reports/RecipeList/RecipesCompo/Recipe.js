import React from 'react'

import { useHistory } from 'react-router-dom'

import { Approval, DoNotDisturb, Details } from '@mui/icons-material'
import {
    Box,
    Button,
    Card,
    CardContent,
    CardMedia,
    Divider,
    Grid,
    Rating,
    Typography,
} from '@mui/material'
import { grey } from '@mui/material/colors'

import ConfirmPopup from '../ConfirmPopup'
import DetailPopup from '../DetailPopup'

const LatestRecipe = ({ post, reportHandler }) => {
    const [open, setOpen] = React.useState(false)
    const [openConfirm, setOpenConfirm] = React.useState(false)
    const [isDeny, setDeny] = React.useState(false)
    const [isApprove, setApprove] = React.useState(false)
    const history = useHistory()
    const handleClickOpen = () => {
        setOpen(true)
    }
    const handleOpenConfirmApprove = () => {
        setApprove(true)
        setOpenConfirm(true)
    }
    const handleOpenConfirmDeny = () => {
        setDeny(true)
        setOpenConfirm(true)
    }
    return (
        <React.Fragment>
            {open && (
                <DetailPopup reason={post.reason} status={open} onClose={() => setOpen(false)} />
            )}
            {openConfirm && (
                <ConfirmPopup
                    reportId={post.id}
                    isDeny={isDeny}
                    isApprove={isApprove}
                    status={openConfirm}
                    onClose={() => setOpenConfirm(false)}
                    reportHandler={reportHandler}
                />
            )}
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
                        <Typography
                            gutterBottom
                            variant="h5"
                            component="div"
                            fontWeight={700}
                            sx={{
                                overflow: 'hidden',
                                display: '-webkit-box',
                                WebkitBoxOrient: 'vertical',
                                WebkitLineClamp: '1',
                                textOverflow: 'ellipsis',
                            }}
                        >
                            {post.postName}
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
                            {post.postDescription}
                        </Typography>
                        <Rating
                            name="half-rating-read"
                            value={post.rating}
                            precision={0.5}
                            readOnly
                            sx={{ mt: 2 }}
                        />
                        <Box mt={1}>
                            <Typography component="span" sx={{ color: grey[500] }}>
                                By
                            </Typography>
                            <Typography component="span" ml={1.5} variant="body2" fontWeight={700}>
                                {post.postUserName}
                            </Typography>
                        </Box>
                        <Divider
                            sx={{
                                backgroundColor: (theme) => theme.palette.primary.main,
                                height: 2,
                                mt: 2,
                            }}
                        />
                        <Box mt={2}>
                            <Typography component="span" sx={{ color: grey[700] }}>
                                Reporter:
                            </Typography>
                            <Typography component="span" ml={1} variant="body2" fontWeight={700}>
                                {post.userName}
                            </Typography>
                        </Box>
                        <Box
                            mt={2}
                            display="flex"
                            justifyContent="space-evenly"
                            alignItems="center"
                        >
                            <Button
                                variant="outlined"
                                color="success"
                                sx={{
                                    width: 120,
                                    minWidth: 100,
                                }}
                                startIcon={<Approval />}
                                onClick={handleOpenConfirmApprove}
                            >
                                Approve
                            </Button>
                            <Button
                                variant="outlined"
                                color="error"
                                sx={{
                                    width: 120,
                                    minWidth: 100,
                                }}
                                startIcon={<DoNotDisturb />}
                                onClick={handleOpenConfirmDeny}
                            >
                                Deny
                            </Button>
                        </Box>
                        <Box display="flex" alignItems="center" justifyContent="center">
                            <Divider
                                sx={{
                                    width: '95%',
                                    height: 2,
                                    mt: 3,
                                }}
                            />
                        </Box>
                        <Box mt={3} display="flex" justifyContent="center">
                            <Button
                                variant="contained"
                                sx={{
                                    width: '95%',
                                    minWidth: 100,
                                }}
                                startIcon={<Details />}
                                onClick={handleClickOpen}
                            >
                                View Reason
                            </Button>
                        </Box>
                    </CardContent>
                </Card>
            </Grid>
        </React.Fragment>
    )
}

export default LatestRecipe
