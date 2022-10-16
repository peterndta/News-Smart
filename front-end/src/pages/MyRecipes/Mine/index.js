import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import NumberItemPagination from '../../../components/NumberItemPagination'
import { Box } from '@mui/material'

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
                    <NumberItemPagination
                        from={fromTo.from}
                        to={fromTo.to}
                        all={fromTo.totalCount}
                    />
                    <Recipes posts={recipes.list} />
                    {recipes.pageCount !== 1 && <Paging size={recipes.pageCount} />}
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default Mine
