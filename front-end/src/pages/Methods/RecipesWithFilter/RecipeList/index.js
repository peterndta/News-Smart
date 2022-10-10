import React, { useEffect } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

import { Grid } from '@mui/material'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import useRecipe from '../../../../recoil/recipe/action'
import Paging from '../Pagination'
import Sort from '../Sort'
import Recipes from './RecipesCompo'

const filterStringGenerator = ({ search, method, sort }) => {
    let filterString = `&pageSize=${6}`

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

    useEffect(() => {
        const params = filterStringGenerator({ search, method, sort })

        if (pageNum === undefined) recipeAction.getRecipes(params)
        else recipeAction.getRecipesFilterMethod(params, pageNum)
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, sort, pageNum, method])

    return (
        <Grid item md={9} display="flex" flexDirection="column">
            <Sort />
            <Recipes posts={MOST_FAVORITE_POSTS} />
            <Paging size={10} />
        </Grid>
    )
}

export default RecipeList
