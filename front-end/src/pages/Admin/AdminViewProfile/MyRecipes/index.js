import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useLocation, useParams } from 'react-router-dom'

import { Assignment } from '@mui/icons-material'
import { Box, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import { useSnackbar } from '../../../../HOCs/SnackbarContext'
import useMyRecipe from '../../../../recoil/my-recipe/action'
import Loading from '../../../Loading'
import Paging from './Pagination'
import RecipeList from './RecipeList'
import SearchBox from './Search'

const filterStringGenerator = ({ search, sort }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    if (sort !== undefined) filterString += `&sort=${sort}`

    return filterString
}

const MyRecipes = () => {
    const { id } = useParams()
    const { search: query } = useLocation()
    const { search, sort, pageNum } = queryString.parse(query)
    const myRecipesAction = useMyRecipe()
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)

    useEffect(() => {
        const params = filterStringGenerator({ search, sort })
        setIsLoading(true)

        if (pageNum === undefined) {
            myRecipesAction
                .getRecipes(+id, params)
                .then((res) => {
                    const listRecipe = res.data.data
                    const { totalPages } = res.data.meta
                    setRecipes({ list: listRecipe, pageCount: totalPages })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
                .catch(() => {
                    showSnackBar({
                        severity: 'error',
                        children: 'Something went wrong, please try again later.',
                    })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
        } else {
            myRecipesAction
                .getRecipes(+id, params, pageNum)
                .then((res) => {
                    const listRecipe = res.data.data
                    const { totalPages } = res.data.meta
                    setRecipes({ list: listRecipe, pageCount: totalPages })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
                .catch(() => {
                    showSnackBar({
                        severity: 'error',
                        children: 'Something went wrong, please try again later.',
                    })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
        }
        return () => {
            setRecipes({})
            setIsLoading(false)
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, sort, pageNum])

    return (
        <React.Fragment>
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <Box display="flex" alignItems="flex-end" justifyContent="space-between" m={4}>
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
                        <SearchBox />
                    </Box>
                    <RecipeList posts={recipes.list} />
                    {recipes.pageCount !== 1 && <Paging size={recipes.pageCount} />}
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default MyRecipes
