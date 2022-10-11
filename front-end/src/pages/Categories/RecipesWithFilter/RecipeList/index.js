import React, { useEffect } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

import { Grid } from '@mui/material'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import useRecipe from '../../../../recoil/recipe/action'
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

    useEffect(() => {
        const params = filterStringGenerator({ search, category, sort })

        if (pageNum === undefined) recipeAction.getRecipes(params)
        else recipeAction.getRecipesFilterCategory(params, pageNum)
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, sort, pageNum, category])

    return (
        <Grid item md={9} display="flex" flexDirection="column">
            <Sort />
            <Recipes posts={MOST_FAVORITE_POSTS} />
            <Paging size={10} />
        </Grid>
    )
}

export default RecipeList
