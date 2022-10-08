import React, { useEffect, useState } from 'react'

import { useParams } from 'react-router-dom'

import {
    StarRateOutlined,
    BookmarkBorder,
    ShoppingCart,
    Kitchen,
    RestaurantMenu,
} from '@mui/icons-material'
import GroupIcon from '@mui/icons-material/Group'
import {
    Breadcrumbs,
    Typography,
    Link,
    Box,
    Rating,
    Grid,
    List,
    ListItem,
    ListItemButton,
    ListItemIcon,
    Divider,
} from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import { useSnackbar } from '../../HOCs/SnackbarContext'
import { useRecipe } from '../../recoil/recipe'

const RecipeDetail = () => {
    const [recipe, setRecipe] = useState({})
    const { id } = useParams()
    const { getRecipe } = useRecipe()
    const showSackbar = useSnackbar()
    useEffect(() => {
        getRecipe(id)
            .then((resposne) => {
                const data = resposne.data.data
                console.log(data)
                setRecipe(data)
            })
            .catch(() => {
                showSackbar({
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
        <Box mt={4}>
            <Breadcrumbs separator="›" aria-label="breadcrumb">
                {breadcrumbs}
            </Breadcrumbs>
            <Typography mt={4} variant="h3" fontWeight={700} sx={{ color: blueGrey[800] }}>
                {recipe?.name}
            </Typography>
            <Box display="flex">
                <Rating name="half-rating-read" value={4} precision={0.5} readOnly sx={{ mt: 1 }} />
            </Box>
            <Typography mt={1} variant="subtitle1" sx={{ fontSize: 18, width: '84%' }}>
                Homemade chicken soup - but you do not have to be sick to deserve or enjoy it - you
                do, so do! Good for body and soul!
            </Typography>
            <Grid mt={3} container columnSpacing={4}>
                <Grid item md={1}>
                    <List sx={{ pl: 1 }}>
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
                                    26 minutes
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
                                    26 minutes
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
                                    26 minutes
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
                                        4 people
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
                                    <ShoppingCart fontSize="small" sx={{ color: blueGrey[800] }} />
                                    <Typography
                                        ml={1}
                                        variant="subtitle1"
                                        sx={{ fontSize: 18, width: '77%' }}
                                    >
                                        1 (3 pound) whole chicken, 4 carrots, halved, 4 stalks
                                        celery, halved.
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
                                        Cooker, Knife, Blender.
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

                                borderBottom: (theme) => `5px solid ${theme.palette.primary.main}`,
                                display: 'inline-block',
                            }}
                        >
                            Processing
                        </Typography>
                        <Box mt={4} mb={8} ml={3} display="flex" alignItems="center">
                            <Typography variant="subtitle1" sx={{ fontSize: 20, width: '77%' }}>
                                Put the chicken, carrots, celery and onion in a large soup pot and
                                cover with cold water. Heat and simmer, uncovered, until the chicken
                                meat falls off of the bones (skim off foam every so often).
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

                                borderBottom: (theme) => `5px solid ${theme.palette.primary.main}`,
                                display: 'inline-block',
                            }}
                        >
                            Cooking
                        </Typography>
                        <Box mt={4} mb={8} ml={3} display="flex" alignItems="center">
                            <Typography variant="subtitle1" sx={{ fontSize: 20, width: '77%' }}>
                                Put the chicken, carrots, celery and onion in a large soup pot and
                                cover with cold water. Heat and simmer, uncovered, until the chicken
                                meat falls off of the bones (skim off foam every so often).
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

                                borderBottom: (theme) => `5px solid ${theme.palette.primary.main}`,
                                display: 'inline-block',
                            }}
                        >
                            Nutrition Facts
                        </Typography>
                        <Box mt={3} mb={8} ml={3} display="flex" alignItems="center">
                            <RestaurantMenu fontSize="medium" sx={{ color: blueGrey[800] }} />
                            <Typography
                                ml={1}
                                variant="subtitle1"
                                sx={{ fontSize: 18, width: '77%' }}
                            >
                                152 calories; protein 13.1g; carbohydrates 4.2g; fat 8.9g;
                                cholesterol 36.9mg; sodium 67.6mg.
                            </Typography>
                        </Box>
                    </Box>
                    <Box mt={10} mb={8} ml={80} display="flex">
                        <Typography variant="body1" sx={{ fontSize: 15, color: blueGrey[600] }}>
                            Recipe by
                        </Typography>
                        <Typography ml={1} variant="body1" fontWeight={700} sx={{ fontSize: 15 }}>
                            The Allrecipes Community
                        </Typography>
                    </Box>
                </Grid>
            </Grid>
        </Box>
    )
}

export default RecipeDetail
