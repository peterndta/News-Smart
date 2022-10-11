import React, { useEffect } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

// import queryString from 'query-string'
// import { useLocation } from 'react-router-dom'
import { Grid } from '@mui/material'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import useRecipe from '../../../../recoil/recipe/action'
import Paging from '../Pagination'
import Sort from '../Sort'
import Recipes from './RecipesCompo'

const filterStringGenerator = ({ search, continent, use, sort }) => {
    let filterString = `&pageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    if (continent && Array.isArray(continent))
        continent.forEach((continent) => (filterString += `&continent=${continent}`))
    else if (continent !== undefined) filterString += `&continent=${continent}`

    if (use && Array.isArray(use)) use.forEach((use) => (filterString += `&use=${use}`))
    else if (use !== undefined) filterString += `&use=${use}`

    if (sort !== undefined) filterString += `&sort=${sort}`

    return filterString
}

const RecipeList = () => {
    const { search: query } = useLocation()
    const { use, continent, search, sort, pageNum } = queryString.parse(query)
    const recipeAction = useRecipe()

    useEffect(() => {
        const params = filterStringGenerator({ search, continent, use, sort })

        if (pageNum === undefined) recipeAction.getRecipes(params)
        else recipeAction.getRecipes(params, pageNum)
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [use, continent, search, sort, pageNum])
    return (
        <Grid item md={9} display="flex" flexDirection="column">
            <Sort />
            <Recipes posts={MOST_FAVORITE_POSTS} />
            <Paging size={10} />
        </Grid>
    )
}

export default RecipeList
