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
import Loading from '../../Loading'
import Paging from './Pagination'
import Recipes from './Recipes'
import SearchBox from './Search'
import Sort from './Sort'

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
                    <Box display="flex" justifyContent="space-between" alignItems="center">
                        <SearchBox />
                        <Sort />
                    </Box>
                    {recipes.length ? (
                        <React.Fragment>
                            <NumberItemPagination
                                from={fromTo.from}
                                to={fromTo.to}
                                all={fromTo.totalCount}
                            />
                            <Recipes posts={recipes.list} />
                            {recipes.pageCount !== 1 && <Paging size={recipes.pageCount} />}
                        </React.Fragment>
                    ) : (
                        <Box alignItems="center" textAlign="center" mt={5}>
                            <Typography fontSize={38} fontWeight={700} sx={{ color: grey[700] }}>
                                You haven’t created any recipes yet
                            </Typography>
                            <Typography fontSize={20} mt={3} sx={{ color: grey[700] }}>
                                To add a recipe click the button{' '}
                                <Box component="span" fontWeight={700}>
                                    ADD A RECIPE
                                </Box>
                            </Typography>
                            <Box
                                mt={4}
                                component="img"
                                alt="food"
                                src="https://scontent.fsgn2-6.fna.fbcdn.net/v/t1.15752-9/307589926_834744197705463_2982451241580080174_n.png?_nc_cat=111&ccb=1-7&_nc_sid=ae9488&_nc_ohc=YAQCDp9K8pkAX9rl9-z&_nc_ht=scontent.fsgn2-6.fna&oh=03_AdRFe2c-TMn6SeEmCClPqnvxknL6sOrF1rmtO59ij8T4wQ&oe=6378DC07"
                                sx={{
                                    width: '20%',
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
