import React, { useEffect, useState } from 'react'

import { Box } from '@mui/material'

import { useSnackbar } from '../../HOCs/SnackbarContext'
// import { MOST_FAVORITE_POSTS, LATEST_POSTS } from '../../Elixir'
import meal from '../../assets/images/meal.jpg'
import Loading from '../../pages/Loading'
import useRecipe from '../../recoil/recipe/action'
import Recipes from './RecipesCompo'

const Home = () => {
    const [recipesLatest, setRecipeLatest] = useState([])
    const [recipesFavorite, setRecipeFavorite] = useState([])
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)
    const { getRecipes } = useRecipe()
    useEffect(() => {
        const paramsLatest = '?PageSize=6&sort=Newest'
        const paramsFavorite = '?PageSize=6&sort=Popularity'
        setIsLoading(true)

        getRecipes(paramsLatest)
            .then((res) => {
                const data = res.data.data
                setRecipeLatest(data)
                setIsLoading(false)
            })
            .catch(() => {
                showSnackBar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
                setIsLoading(false)
            })
        getRecipes(paramsFavorite)
            .then((res) => {
                const data = res.data.data
                setIsLoading(false)
                setRecipeFavorite(data)
            })
            .catch(() => {
                showSnackBar({
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
                        <Box
                            component="img"
                            alt="meal"
                            src={meal}
                            sx={{
                                width: '100%',
                                aspectRatio: '16 / 9',
                                objectFit: 'cover',
                                height: 300,
                            }}
                        />
                        <Recipes
                            posts={recipesLatest}
                            title="Latest Recipes"
                            linkTo={'/recipes?sort=Newest'}
                        />
                        <Recipes
                            posts={recipesFavorite}
                            title="Recipes You'll Love"
                            linkTo={'/recipes?sort=Popularity'}
                        />
                    </Box>
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default Home
