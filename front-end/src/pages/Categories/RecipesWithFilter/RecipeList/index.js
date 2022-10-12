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

const filterStringGenerator = ({ search, category, sort }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    if (category && Array.isArray(category))
        category.forEach((category) => (filterString += `&category=${category}`))
    else if (category !== undefined) filterString += `&category=${category}`

    if (sort !== undefined) filterString += `&sort=${sort}`

    return filterString
}

const RecipeList = () => {
    const { search: query } = useLocation()
    const { search, sort, category, pageNum } = queryString.parse(query)
    const recipeAction = useRecipe()
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)

    if (Array.isArray(category)) category.sort((a, b) => a.localeCompare(b))

    useEffect(() => {
        const params = filterStringGenerator({ search, category, sort })
        setIsLoading(true)

        if (pageNum === undefined)
            recipeAction
                .getRecipes(params)
                .then((res) => {
                    const listRecipe = res.data.data
                    const { totalPages } = res.data.meta
                    setRecipes({ list: listRecipe, pageCount: totalPages })
                    setIsLoading(false)
                })
                .catch(() => {
                    showSnackBar({
                        severity: 'error',
                        children: 'Something went wrong, please try again later.',
                    })
                    setIsLoading(false)
                })
        else
            recipeAction
                .getRecipes(params, pageNum)
                .then((res) => {
                    const listRecipe = res.data.data
                    const { totalPages } = res.data.meta
                    setIsLoading(false)
                    setRecipes({ list: listRecipe, pageCount: totalPages })
                })
                .catch(() => {
                    showSnackBar({
                        severity: 'error',
                        children: 'Something went wrong, please try again later.',
                    })
                    setIsLoading(false)
                })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, sort, pageNum, JSON.stringify(category)])

    return (
        <Grid item md={9} display="flex" flexDirection="column">
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <Sort />
                    <Recipes posts={recipes.list} />
                    <Paging size={recipes.pageCount} />
                </React.Fragment>
            )}
        </Grid>
    )
}

export default RecipeList
