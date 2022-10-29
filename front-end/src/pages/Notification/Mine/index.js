import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import NumberItemPagination from '../../../components/NumberItemPagination'
import { Box, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import { useSnackbar } from '../../../HOCs/SnackbarContext'
import authAtom from '../../../recoil/auth/atom'
import useMyRecipe from '../../../recoil/my-recipe/action'
import useRecipe from '../../../recoil/recipe/action'
import Loading from '../../Loading'
import LoadMore from './LoadMore'
import Recipes from './Recipes'

const filterStringGenerator = ({ search, sort }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    if (sort !== undefined) filterString += `&sort=${sort}`

    return filterString
}
const Mine = () => {
    const { search: query } = useLocation()
    const { search, sort, pageNum } = queryString.parse(query)
    const auth = useRecoilValue(authAtom)
    const myRecipesAction = useMyRecipe()
    const { deleteRecipe } = useRecipe()
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)
    const [fromTo, setFromTo] = useState({ from: 1, to: 1, totalCount: 1 })

    useEffect(() => {
        const params = filterStringGenerator({ search, sort })
        setIsLoading(true)

        if (pageNum === undefined) {
            myRecipesAction
                .getRecipes(auth.userId, params)
                .then((res) => {
                    const listRecipe = res.data.data
                    const { totalPages, from, to, totalCount } = res.data.meta
                    setRecipes({ list: listRecipe, pageCount: totalPages })
                    setFromTo({ from, to, totalCount })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
                .catch((error) => {
                    const message = error.response.data.message
                    showSnackBar({
                        severity: message == 'Do not have any post' ? 'info' : 'error',
                        children: message || 'Something went wrong, please try again later.',
                    })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
        } else {
            myRecipesAction
                .getRecipes(auth.userId, params, pageNum)
                .then((res) => {
                    const listRecipe = res.data.data
                    const { totalPages, from, to, totalCount } = res.data.meta
                    setRecipes({ list: listRecipe, pageCount: totalPages })
                    setFromTo({ from, to, totalCount })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
                .catch((error) => {
                    const message = error.response.data.message
                    showSnackBar({
                        severity: message == 'Do not have any post' ? 'info' : 'error',
                        children: message || 'Something went wrong, please try again later.',
                    })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, sort, pageNum])

    return (
        <React.Fragment>
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    {recipes.list.length ? (
                        <React.Fragment>
                            <NumberItemPagination
                                from={fromTo.from}
                                to={fromTo.to}
                                all={fromTo.totalCount}
                            />
                            <Recipes posts={recipes.list} />
                            <LoadMore size={recipes.pageCount} />
                        </React.Fragment>
                    ) : (
                        <Box alignItems="center" textAlign="center" mt={5}>
                            <Typography fontSize={36} fontWeight={700} sx={{ color: grey[600] }}>
                                You currently do not have any notification
                            </Typography>
                            <Typography fontSize={18} mt={3} sx={{ color: grey[700] }}>
                                You will receive a notification when your recipe is deleted
                            </Typography>
                            <Box
                                component="img"
                                alt="food"
                                src="https://scontent.fsgn2-2.fna.fbcdn.net/v/t1.15752-9/262989158_442351117396944_4567609251679745718_n.png?_nc_cat=103&ccb=1-7&_nc_sid=ae9488&_nc_ohc=CceAPHlsMOkAX-4HYRw&_nc_ht=scontent.fsgn2-2.fna&oh=03_AdReiJanTE3qC1KJErOB5k437zczpPH-18OgcO4O9GlPpg&oe=63829E96"
                                sx={{
                                    width: '18%',
                                    opacity: 0.6,
                                }}
                            />
                        </Box>
                    )}
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default Mine
