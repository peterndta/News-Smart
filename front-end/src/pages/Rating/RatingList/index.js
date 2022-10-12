import React, { useEffect } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

import NumberItemPagination from '../../../components/NumberItemPagination'
import { Box } from '@mui/material'

import { MOST_FAVORITE_POSTS } from '../../../Elixir'
import Paging from '../../MyRecipes/Mine/Pagination'
import Recipes from '../../MyRecipes/Mine/Recipes'
import SearchBox from './Search'
import Sort from './Sort'

const filterStringGenerator = ({ search, sort }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    if (sort !== undefined) filterString += `&sort=${sort}`

    return filterString
}

const RatingList = () => {
    const { search: query } = useLocation()
    const { search, sort, pageNum } = queryString.parse(query)

    useEffect(() => {
        const params = filterStringGenerator({ search, sort })
        console.log(params)
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, sort, pageNum])

    return (
        <React.Fragment>
            <Box display="flex" justifyContent="space-between" alignItems="center">
                <SearchBox />
                <Sort />
            </Box>
            <NumberItemPagination from={1} to={6} all={15} />
            <Recipes posts={MOST_FAVORITE_POSTS} />
            <Paging />
        </React.Fragment>
    )
}

export default RatingList
