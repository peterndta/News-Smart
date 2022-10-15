import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { Box, Pagination } from '@mui/material'

const Paging = ({ size }) => {
    const history = useHistory()
    const { search: query, pathname } = useLocation()
    const { search, sort, pageNum } = queryString.parse(query)
    const [pageNumber, setPageNumber] = useState(pageNum ? +pageNum : 1)

    const pagingHandler = (__, value) => setPageNumber(value)

    const filterHandler = () => {
        let route = pathname + '?'
        if (search && search.trim() !== '') route += '&name=' + search

        if (sort) route += `&sort=${sort}`

        if (pageNumber !== 1) route += `&pageNum=${pageNumber}`

        history.push(route)
    }

    useEffect(() => {
        filterHandler()
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [pageNumber])

    return (
        <Box display="flex" justifyContent="center" mt={4}>
            <Pagination
                count={size}
                variant="outlined"
                sx={{ alignSelf: 'center', mt: 6 }}
                onChange={pagingHandler}
                page={pageNumber}
            />
        </Box>
    )
}

export default Paging
