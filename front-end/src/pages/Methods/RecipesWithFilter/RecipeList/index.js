import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

import { Grid } from '@mui/material'

import { useSnackbar } from '../../../../HOCs/SnackbarContext'
import useRecipe from '../../../../recoil/recipe/action'
import Loading from '../../../Loading'
import Paging from '../Pagination'
import Sort from '../Sort'
import Recipes from './RecipesCompo'

const filterStringGenerator = ({ search, method, sort }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    if (method && Array.isArray(method))
        method.forEach((method) => (filterString += `&method=${method}`))
    else if (method !== undefined) filterString += `&method=${method}`

    if (sort !== undefined) filterString += `&sort=${sort}`

    return filterString
}

const RecipeList = () => {
    const { search: query } = useLocation()
    const { search, sort, method, pageNum } = queryString.parse(query)
    const recipeAction = useRecipe()
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)

    if (Array.isArray(method)) method.sort((a, b) => a.localeCompare(b))

    useEffect(() => {
        const params = filterStringGenerator({ search, method, sort })
        setIsLoading(true)

        if (pageNum === undefined)
            recipeAction
                .getRecipes(params)
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
        else
            recipeAction
                .getRecipes(params, pageNum)
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
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, sort, pageNum, JSON.stringify(method)])

    return (
        <Grid item md={9} display="flex" flexDirection="column">
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <Sort />
                    <Recipes posts={recipes.list} />
                    {recipes.pageCount !== 1 && <Paging size={recipes.pageCount} />}
                </React.Fragment>
            )}
        </Grid>
    )
}

export default RecipeList
