import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { Pagination } from '@mui/material'

const Paging = ({ size }) => {
    const history = useHistory()
    const { search: query, pathname } = useLocation()
    const { use, continent, search, sort, pageNum } = queryString.parse(query)
    const [pageNumber, setPageNumber] = useState(pageNum ? +pageNum : 1)

    const pagingHandler = (__, value) => setPageNumber(value)

    const filterHandler = () => {
        let route = pathname + '?'
        if (search && search.trim() !== '') route += '&search=' + search

        if (continent && Array.isArray(continent))
            continent.forEach((continent) => (route += `&continent=${continent}`))
        else if (continent !== undefined) route += `&continent=${continent}`

        if (Array.isArray(use) && use?.length !== 0) use?.forEach((use) => (route += `&use=${use}`))
        else if (use !== undefined) route += `&use=${use}`

        if (sort) route += `&sort=${sort}`

        if (pageNumber !== 1) route += `&pageNum=${pageNumber}`

        history.push(route)
    }

    useEffect(() => {
        filterHandler()
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [pageNumber])

    return (
        <Pagination
            count={size}
            variant="outlined"
            sx={{ alignSelf: 'center', mt: 6 }}
            onChange={pagingHandler}
            page={pageNumber}
        />
    )
}

export default Paging
