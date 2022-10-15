import React, { useEffect, useState } from 'react'

import ReactPlayer from 'react-player/youtube'
import { useParams } from 'react-router-dom'

import { Kitchen, ShoppingCart } from '@mui/icons-material'
import GroupIcon from '@mui/icons-material/Group'
import { Box, Divider, Grid, Rating, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import { useSnackbar } from '../../../HOCs/SnackbarContext'
import { useRecipe } from '../../../recoil/recipe'
import Loading from '../../Loading'

const RecipeDetail = () => {
    const [recipe, setRecipe] = useState({})
    const [categories, setCategories] = useState([])
    const [step, setStep] = useState({})
    const [star, setStar] = useState(0)
    const { id } = useParams()
    const { getRecipe, getStep } = useRecipe()
    const showSnackbar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)
    useEffect(() => {
        setIsLoading(true)
        getRecipe(id)
            .then((response) => {
                const data = response.data.data
                setRecipe(data)
                setCategories(data.listCategories)
                setStar(data.averageRating)
                setIsLoading(false)
            })
            .catch(() => {
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
                setIsLoading(false)
            })

        getStep(id)
            .then((response) => {
                const data = response.data.data
                setStep(data)
                setIsLoading(false)
            })
            .catch(() => {
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
                setIsLoading(false)
            })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [])
    return (
        <React.Fragment>
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <Box mt={8}>
                        <Typography
                            mt={4}
                            variant="h3"
                            fontWeight={700}
                            sx={{ color: blueGrey[800] }}
                        >
                            {recipe.name}
                        </Typography>
                        <Box mt={4} display="flex">
                            <Typography
                                variant="subtitle1"
                                sx={{ fontSize: 20, mt: 0.3, color: blueGrey[700] }}
                                fontWeight={700}
                                mr={1.2}
                            >
                                Rating:
                            </Typography>
                            <Rating
                                name="half-rating-read"
                                value={star}
                                precision={0.5}
                                readOnly
                                sx={{ mt: 0.75 }}
                            />
                        </Box>

                        <Box display="flex">
                            <Box display="flex">
                                <Typography
                                    variant="subtitle1"
                                    sx={{ fontSize: 20, mt: 0.75, color: blueGrey[700] }}
                                    fontWeight={700}
                                >
                                    Method:
                                </Typography>
                                <Typography
                                    ml={1}
                                    variant="subtitle1"
                                    fontWeight={400}
                                    sx={{ fontSize: 20, mt: 0.75, color: grey[600] }}
                                >
                                    {recipe?.method}
                                </Typography>
                            </Box>
                            <Box display="flex">
                                <Typography
                                    ml={3}
                                    variant="subtitle1"
                                    sx={{ fontSize: 20, mt: 0.75, color: blueGrey[700] }}
                                    fontWeight={700}
                                >
                                    Continents:
                                </Typography>
                                <Typography
                                    ml={1}
                                    variant="subtitle1"
                                    fontWeight={400}
                                    sx={{ fontSize: 20, mt: 0.75, color: grey[600] }}
                                >
                                    {recipe?.continents}
                                </Typography>
                            </Box>
                        </Box>
                        <Box display="flex">
                            <Typography
                                variant="subtitle1"
                                sx={{ fontSize: 20, mt: 0.75, color: blueGrey[700] }}
                                fontWeight={700}
                                mr={1}
                            >
                                Categories:{' '}
                            </Typography>
                            {categories?.length ? (
                                <Box display="flex">
                                    {categories.map((item, index) => (
                                        <Typography
                                            key={item.id}
                                            variant="subtitle1"
                                            fontWeight={400}
                                            sx={{ fontSize: 20, mt: 0.75, color: grey[600] }}
                                        >
                                            {(index ? ', ' : '') + item.type}
                                        </Typography>
                                    ))}
                                </Box>
                            ) : (
                                <Typography
                                    variant="subtitle1"
                                    fontWeight={400}
                                    sx={{ fontSize: 20, mt: 0.75, color: grey[600] }}
                                >
                                    Updating
                                </Typography>
                            )}
                        </Box>
                        <Typography
                            mt={4}
                            variant="h4"
                            fontWeight={700}
                            sx={{
                                color: blueGrey[800],
                                pb: 0.125,
                                display: 'inline-block',
                            }}
                        >
                            About this recipe
                        </Typography>
                        <Box display="flex" mt={1.5} sx={{ width: '84%' }}>
                            <Divider
                                orientation="vertical"
                                flexItem
                                variant="middle"
                                sx={{
                                    borderRightWidth: '5px',
                                    backgroundColor: (theme) => theme.palette.primary.main,
                                }}
                            />
                            <Typography ml={1} variant="subtitle1" sx={{ fontSize: 21 }}>
                                {recipe.description}
                            </Typography>
                        </Box>
                        <Box mt={3}>
                            <Grid ml={5} item>
                                <Box
                                    component="img"
                                    alt="food"
                                    src={recipe.imageUrl}
                                    sx={{
                                        width: '75%',
                                        aspectRatio: '16 / 9',
                                        objectFit: 'cover',
                                    }}
                                />
                                <Box mt={5}>
                                    <Grid container>
                                        <Grid item md={3}>
                                            <Typography
                                                variant="h5"
                                                fontWeight={700}
                                                sx={{ color: blueGrey[800], fontSize: 22 }}
                                                align="center"
                                            >
                                                Preparing
                                            </Typography>
                                            <Typography
                                                mt={2}
                                                variant="body1"
                                                color="text.primary"
                                                align="center"
                                                sx={{ fontSize: 19 }}
                                            >
                                                {step.preparingTime} minutes
                                            </Typography>
                                        </Grid>
                                        <Divider orientation="vertical" flexItem />
                                        <Grid item md={3}>
                                            <Typography
                                                variant="h5"
                                                fontWeight={700}
                                                sx={{ color: blueGrey[800], fontSize: 22 }}
                                                align="center"
                                            >
                                                Processing
                                            </Typography>
                                            <Typography
                                                mt={2}
                                                variant="body1"
                                                color="text.primary"
                                                align="center"
                                                sx={{ fontSize: 19 }}
                                            >
                                                {step.processingTime} minutes
                                            </Typography>
                                        </Grid>
                                        <Divider orientation="vertical" flexItem />
                                        <Grid item md={3}>
                                            <Typography
                                                variant="h5"
                                                fontWeight={700}
                                                sx={{ color: blueGrey[800], fontSize: 22 }}
                                                align="center"
                                            >
                                                Cooking
                                            </Typography>
                                            <Typography
                                                mt={2}
                                                variant="body1"
                                                color="text.primary"
                                                align="center"
                                                sx={{ fontSize: 19 }}
                                            >
                                                {step.cookingTime} minutes
                                            </Typography>
                                        </Grid>
                                    </Grid>
                                </Box>
                                <Box mt={6}>
                                    <Grid container>
                                        <Grid item md={8}>
                                            <Typography
                                                variant="h4"
                                                fontWeight={700}
                                                sx={{
                                                    color: blueGrey[800],
                                                    pb: 0.125,
                                                    borderBottom: (theme) =>
                                                        `5px solid ${theme.palette.primary.main}`,
                                                    display: 'inline-block',
                                                }}
                                            >
                                                Preparing
                                            </Typography>
                                        </Grid>
                                        <Grid item md={4}>
                                            <Box display="flex" alignItems="center">
                                                <GroupIcon fontSize="medium" />
                                                <Typography
                                                    variant="body1"
                                                    fontWeight={700}
                                                    sx={{ fontSize: 18 }}
                                                >
                                                    Serving:
                                                </Typography>
                                                <Typography
                                                    ml={1}
                                                    variant="body1"
                                                    sx={{ fontSize: 18 }}
                                                >
                                                    {step.serving} people
                                                </Typography>
                                            </Box>
                                        </Grid>
                                    </Grid>
                                    <Box mt={3} ml={3}>
                                        <Typography
                                            mt={4}
                                            variant="h5"
                                            fontWeight={700}
                                            sx={{ color: blueGrey[800] }}
                                        >
                                            Ingredients:
                                        </Typography>
                                        <Box mt={3} ml={3} display="flex" alignItems="flex-start">
                                            <ShoppingCart
                                                fontSize="small"
                                                sx={{ color: blueGrey[800], pt: 0.8 }}
                                            />
                                            <Typography
                                                ml={1}
                                                variant="subtitle1"
                                                sx={{ fontSize: 18, width: '75%' }}
                                            >
                                                {step.ingredient}
                                            </Typography>
                                        </Box>
                                    </Box>
                                    <Box mt={3} ml={3}>
                                        <Typography
                                            variant="h5"
                                            fontWeight={700}
                                            sx={{ color: blueGrey[800] }}
                                        >
                                            Tools needed:
                                        </Typography>
                                        <Box
                                            mt={3}
                                            mb={7}
                                            ml={3}
                                            display="flex"
                                            alignItems="flex-start"
                                        >
                                            <Kitchen
                                                fontSize="small"
                                                sx={{ color: blueGrey[800], pt: 0.8 }}
                                            />
                                            <Typography
                                                ml={1}
                                                variant="subtitle1"
                                                sx={{ fontSize: 18, width: '75%' }}
                                            >
                                                {step?.tool}
                                            </Typography>
                                        </Box>
                                    </Box>
                                </Box>
                                <Box mt={6}>
                                    <Typography
                                        variant="h4"
                                        fontWeight={700}
                                        sx={{
                                            color: blueGrey[800],
                                            pb: 0.125,

                                            borderBottom: (theme) =>
                                                `5px solid ${theme.palette.primary.main}`,
                                            display: 'inline-block',
                                        }}
                                    >
                                        Processing
                                    </Typography>
                                    <Box mt={4} mb={8} ml={3} display="flex" alignItems="center">
                                        <Typography
                                            variant="subtitle1"
                                            sx={{ fontSize: 20, width: '75%' }}
                                        >
                                            {step.processing}
                                        </Typography>
                                    </Box>
                                </Box>
                                <Box mt={6}>
                                    <Typography
                                        variant="h4"
                                        fontWeight={700}
                                        sx={{
                                            color: blueGrey[800],
                                            pb: 0.125,

                                            borderBottom: (theme) =>
                                                `5px solid ${theme.palette.primary.main}`,
                                            display: 'inline-block',
                                        }}
                                    >
                                        Cooking
                                    </Typography>
                                    <Box mt={4} mb={8} ml={3} display="flex" alignItems="center">
                                        <Typography
                                            variant="subtitle1"
                                            sx={{ fontSize: 20, width: '75%' }}
                                        >
                                            {step.cooking}
                                        </Typography>
                                    </Box>
                                </Box>
                                <Box mt={6} width="75%">
                                    <Typography
                                        variant="h4"
                                        fontWeight={700}
                                        sx={{
                                            color: blueGrey[800],
                                            pb: 0.125,

                                            borderBottom: (theme) =>
                                                `5px solid ${theme.palette.primary.main}`,
                                            display: 'inline-block',
                                        }}
                                    >
                                        Video
                                    </Typography>
                                    <Box mt={4} ml={3}>
                                        <ReactPlayer
                                            url={recipe?.videoUrl}
                                            height={400}
                                            width="100%"
                                            controls={true}
                                        />
                                    </Box>
                                    <Box mt={3} display="flex" justifyContent="flex-end">
                                        <Typography
                                            variant="body1"
                                            sx={{ fontSize: 15, color: blueGrey[600] }}
                                        >
                                            Recipe by
                                        </Typography>
                                        <Typography
                                            ml={1}
                                            variant="body1"
                                            fontWeight={700}
                                            sx={{ fontSize: 15 }}
                                        >
                                            {recipe.userName}
                                        </Typography>
                                    </Box>
                                </Box>
                            </Grid>
                        </Box>
                    </Box>
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default RecipeDetail
