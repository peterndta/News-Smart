import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

import { Grid } from '@mui/material'

import { useSnackbar } from '../../../../HOCs/SnackbarContext'
import useReport from '../../../../recoil/report/action'
import Loading from '../../../Loading'
import Paging from '../Pagination'
import Recipes from './RecipesCompo'

const filterStringGenerator = ({ search }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    return filterString
}

const RecipeList = () => {
    const { search: query } = useLocation()
    const { search, pageNum } = queryString.parse(query)
    const recipeAction = useReport()
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)

    useEffect(() => {
        const params = filterStringGenerator({ search })
        setIsLoading(true)
        if (pageNum === undefined) {
            recipeAction
                .getReports(params)
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
            recipeAction
                .getReports(params, pageNum)
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
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, pageNum])

    const reportHandler = (reportId) => {
        setIsLoading(true)
        recipeAction
            .denyReport(reportId)
            .then(() => {
                const cloneRecipes = { ...recipes }
                const newRecipes = cloneRecipes.list.filter((recipe) => recipe.id !== reportId)
                setIsLoading(false)
                setRecipes({ ...recipes, list: newRecipes })
            })
            .catch((error) => {
                const message = error.response.data.message
                setIsLoading(false)
                showSnackBar({
                    severity: 'error',
                    children: message || 'Something went wrong, please try again later.',
                })
            })
    }
    return (
        <Grid item md={12} display="flex" flexDirection="column">
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <Recipes posts={recipes.list} reportHandler={reportHandler} />
                    {recipes.pageCount !== 1 && <Paging size={recipes.pageCount} />}
                </React.Fragment>
            )}
        </Grid>
    )
}

export default RecipeList
