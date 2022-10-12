import React, { useEffect, useState } from 'react'

import ReactPlayer from 'react-player/youtube'
import { useParams } from 'react-router-dom'

import { BookmarkBorder, Kitchen, ShoppingCart, StarRateOutlined } from '@mui/icons-material'
import GroupIcon from '@mui/icons-material/Group'
import {
    Box,
    Breadcrumbs,
    Divider,
    Grid,
    Link,
    List,
    ListItem,
    ListItemButton,
    ListItemIcon,
    Rating,
    Typography,
} from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import { useSnackbar } from '../../HOCs/SnackbarContext'
import { useRecipe } from '../../recoil/recipe'
import RecipeRating from './RecipeRating'

const RecipeDetail = () => {
    const [recipe, setRecipe] = useState({})
    const [categories, setCategories] = useState([])
    const [step, setStep] = useState({})
    const [star, setStar] = useState(0)
    const { id } = useParams()
    const { getRecipe, getStep } = useRecipe()
    const showSnackbar = useSnackbar()
    const [openCreateFeedback, setOpenCreateFeedback] = useState(false)

    const openCreateFeedbackHandler = () => {
        setOpenCreateFeedback(true)
    }

    const closeCreateFeedbackHandler = () => {
        setOpenCreateFeedback(false)
    }

    useEffect(() => {
        getRecipe(id)
            .then((response) => {
                const data = response.data.data
                setRecipe(data)
                setCategories(data.listCategories)
                setStar(data.averageRating)
            })
            .catch(() => {
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
            })

        getStep(id)
            .then((response) => {
                const data = response.data.data
                setStep(data)
            })
            .catch(() => {
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
            })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [])

    const breadcrumbs = [
        <Link underline="hover" key="1" color="inherit" href="/" fontWeight={700}>
            Home
        </Link>,
        <Link underline="hover" key="2" color="inherit" href="/recipes" fontWeight={700}>
            Recipes
        </Link>,
        <Typography key="3" color="text.primary" fontWeight={700}>
            {recipe?.name}
        </Typography>,
    ]

    return (
        <React.Fragment>
            <Box mt={4}>
                <Breadcrumbs separator="›" aria-label="breadcrumb">
                    {breadcrumbs}
                </Breadcrumbs>
                <Typography mt={4} variant="h3" fontWeight={700} sx={{ color: blueGrey[800] }}>
                    {recipe?.name}
                </Typography>
                <Box mt={4} display="flex">
                    <Typography
                        variant="subtitle1"
                        sx={{ fontSize: 20, mt: 0.35, color: blueGrey[700] }}
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
                        sx={{ mt: 1 }}
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
                        {recipe?.description}
                    </Typography>
                </Box>
                <Grid mt={3} container columnSpacing={4}>
                    <Grid item md={1}>
                        <List sx={{ pl: 1, pt: 0.2 }}>
                            <ListItem
                                disablePadding
                                sx={{
                                    borderBottom: `1px solid ${blueGrey[200]}`,
                                    backgroundColor: (theme) => theme.palette.primary.main,
                                }}
                            >
                                <ListItemButton sx={{ height: 50 }}>
                                    <ListItemIcon>
                                        <BookmarkBorder sx={{ color: '#fefefe' }} />
                                    </ListItemIcon>
                                </ListItemButton>
                            </ListItem>
                            <ListItem
                                disablePadding
                                onClick={openCreateFeedbackHandler}
                                sx={{
                                    color: blueGrey[800],
                                    backgroundColor: grey[200],
                                }}
                            >
                                <ListItemButton sx={{ height: 50 }}>
                                    <ListItemIcon>
                                        <StarRateOutlined sx={{ color: blueGrey[800] }} />
                                    </ListItemIcon>
                                </ListItemButton>
                            </ListItem>
                        </List>
                    </Grid>

                    <Grid item md={11}>
                        <Box
                            component="img"
                            alt="food"
                            src={recipe?.imageUrl}
                            sx={{
                                width: '77%',
                                aspectRatio: '16 / 9',
                                objectFit: 'cover',
                                height: '29%',
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
                                        {step?.preparingTime} minutes
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
                                        {step?.processingTime} minutes
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
                                        {step?.cookingTime} minutes
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
                                        <Typography ml={1} variant="body1" sx={{ fontSize: 18 }}>
                                            {step?.serving} people
                                        </Typography>
                                    </Box>
                                </Grid>
                            </Grid>
                            <Box>
                                <Box mt={3} ml={3}>
                                    <Typography
                                        mt={4}
                                        variant="h5"
                                        fontWeight={700}
                                        sx={{ color: blueGrey[800] }}
                                    >
                                        Ingredients:
                                    </Typography>
                                    <Box mt={3} ml={3} display="flex" alignItems="center">
                                        <ShoppingCart
                                            fontSize="small"
                                            sx={{ color: blueGrey[800] }}
                                        />
                                        <Typography
                                            ml={1}
                                            variant="subtitle1"
                                            sx={{ fontSize: 18, width: '77%' }}
                                        >
                                            {step?.ingredient}
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
                                    <Box mt={3} mb={7} ml={3} display="flex" alignItems="center">
                                        <Kitchen fontSize="small" sx={{ color: blueGrey[800] }} />
                                        <Typography
                                            ml={1}
                                            variant="subtitle1"
                                            sx={{ fontSize: 18, width: '77%' }}
                                        >
                                            {step?.tool}
                                        </Typography>
                                    </Box>
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
                                <Typography variant="subtitle1" sx={{ fontSize: 20, width: '77%' }}>
                                    {step?.processing}
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
                                <Typography variant="subtitle1" sx={{ fontSize: 20, width: '77%' }}>
                                    {step?.cooking}
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
                                Video
                            </Typography>
                            <Box mt={4} mb={7} ml={3}>
                                <ReactPlayer
                                    url={recipe?.videoUrl}
                                    height={400}
                                    width={800}
                                    controls={true}
                                />
                            </Box>
                        </Box>
                        <Box mt={10} mb={8} ml={80} display="flex">
                            <Typography variant="body1" sx={{ fontSize: 15, color: blueGrey[600] }}>
                                Recipe by
                            </Typography>
                            <Typography
                                ml={1}
                                variant="body1"
                                fontWeight={700}
                                sx={{ fontSize: 15 }}
                            >
                                {recipe?.userName}
                            </Typography>
                        </Box>
                    </Grid>
                </Grid>
            </Box>
            {openCreateFeedback && (
                <RecipeRating
                    open={openCreateFeedback}
                    onClose={closeCreateFeedbackHandler}
                    setStar={setStar}
                />
            )}
        </React.Fragment>
    )
}

export default RecipeDetail
