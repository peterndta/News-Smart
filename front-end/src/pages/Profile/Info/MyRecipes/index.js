import React, { useEffect, useState } from 'react'

import { Link } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import { Assignment } from '@mui/icons-material'
import { Box, Button, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

// import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import { useSnackbar } from '../../../../HOCs/SnackbarContext'
import Loading from '../../../../pages/Loading'
import authAtom from '../../../../recoil/auth/atom'
import { useMyProfile } from '../../../../recoil/profile'
import RecipeList from './RecipeList'

const MyRecipes = () => {
    const [recipe, setRecipe] = useState([])
    const [isLoading, setIsLoading] = useState(false)
    const showSnackbar = useSnackbar()
    const { getRecentRecipes } = useMyProfile()
    const auth = useRecoilValue(authAtom)

    useEffect(() => {
        setIsLoading(true)

        getRecentRecipes(auth.userId)
            .then((response) => {
                const data = response.data.data
                setRecipe(data)
                setIsLoading(false)
            })
            .catch((error) => {
                const message = error.response.data.message
                showSnackbar({
                    severity: message == 'Do not have any post' ? 'info' : 'error',
                    children: message || 'Something went wrong, please try again later.',
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
                    <Box>
                        <Box display="flex" alignItems="center">
                            <Assignment fontSize="large" sx={{ color: grey[700] }} />
                            <Typography
                                ml={1}
                                variant="h4"
                                fontWeight={700}
                                sx={{ color: grey[700] }}
                            >
                                Recently Recipes
                            </Typography>
                        </Box>
                        {recipe.length ? (
                            <React.Fragment>
                                <RecipeList posts={recipe} />
                                {recipe.length > 6 ? (
                                    <Box display="flex" justifyContent="center" mt={6}>
                                        <Button
                                            variant="contained"
                                            size="large"
                                            sx={{ color: grey[100] }}
                                            component={Link}
                                            to="/recipes/me"
                                        >
                                            Show more
                                        </Button>
                                    </Box>
                                ) : (
                                    ''
                                )}
                            </React.Fragment>
                        ) : (
                            <Typography mt={2} fontWeight={500}>
                                No posts were found.
                            </Typography>
                        )}
                    </Box>
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default MyRecipes
