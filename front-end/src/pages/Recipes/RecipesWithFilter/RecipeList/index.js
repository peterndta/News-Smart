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

const filterStringGenerator = ({ search, continent, use, sort }) => {
    let filterString = `?PageSize=${6}`

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
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)

    if (Array.isArray(continent)) continent.sort((a, b) => a.localeCompare(b))
    if (Array.isArray(use)) use.sort((a, b) => a.localeCompare(b))

    useEffect(() => {
        const params = filterStringGenerator({ search, continent, use, sort })
        if (pageNum === undefined) {
            setIsLoading(true)
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
        } else {
            setIsLoading(true)
            recipeAction
                .getRecipes(params, pageNum)
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
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [JSON.stringify(use), JSON.stringify(continent), search, sort, pageNum])
    return (
        <Grid item md={9} display="flex" flexDirection="column">
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <Sort />
                    <Recipes posts={recipes.list} />
                    <Paging size={recipes.totalPages} />
                </React.Fragment>
            )}
        </Grid>
    )
}

export default RecipeList
