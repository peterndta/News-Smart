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
                            <Box alignItems="center" textAlign="center" mt={6}>
                                <Typography
                                    fontSize={24}
                                    fontWeight={700}
                                    sx={{ color: grey[700] }}
                                >
                                    You haven’t created any recipes yet
                                </Typography>
                                <Typography fontSize={16} mt={2} sx={{ color: grey[700] }}>
                                    To add a recipe click the button{' '}
                                    <Box component="span" fontWeight={700}>
                                        ADD A RECIPE
                                    </Box>
                                </Typography>
                                <Box
                                    mt={3}
                                    component="img"
                                    alt="food"
                                    src="https://scontent.fsgn2-6.fna.fbcdn.net/v/t1.15752-9/307589926_834744197705463_2982451241580080174_n.png?_nc_cat=111&ccb=1-7&_nc_sid=ae9488&_nc_ohc=YAQCDp9K8pkAX9rl9-z&_nc_ht=scontent.fsgn2-6.fna&oh=03_AdRFe2c-TMn6SeEmCClPqnvxknL6sOrF1rmtO59ij8T4wQ&oe=6378DC07"
                                    sx={{
                                        width: '10%',
                                    }}
                                />
                            </Box>
                        )}
                    </Box>
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default MyRecipes
