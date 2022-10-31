import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

import NumberItemPagination from '../../../../../components/NumberItemPagination'

import { useSnackbar } from '../../../../../HOCs/SnackbarContext'
import useRecipe from '../../../../../recoil/recipe/action'
import Loading from '../../../../Loading'
import Paging from '../Pagination'
import PostLists from './PostLists'

const filterStringGenerator = ({ search }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    return filterString
}

const PostList = ({ selectHandler, options }) => {
    const { search: query } = useLocation()
    const { search, pageNum } = queryString.parse(query)
    const recipeAction = useRecipe()
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)
    const [fromTo, setFromTo] = useState({ from: 0, to: 0, totalCount: 1 })

    useEffect(() => {
        const params = filterStringGenerator({ search })
        setIsLoading(true)

        if (pageNum === undefined) {
            recipeAction
                .getRecipes(params)
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
            recipeAction
                .getRecipes(params, pageNum)
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
    }, [search, pageNum])

    return (
        <React.Fragment>
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <NumberItemPagination
                        from={fromTo.from}
                        to={fromTo.to}
                        all={fromTo.totalCount}
                    />
                    <PostLists
                        posts={recipes.list}
                        selectHandler={selectHandler}
                        options={options}
                    />
                    {recipes.pageCount !== 1 && <Paging size={recipes.pageCount} />}
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default PostList
