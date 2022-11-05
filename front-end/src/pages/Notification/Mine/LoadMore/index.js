import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

const LoadMore = () => {
    const history = useHistory()
    const { search: query, pathname } = useLocation()
    const { sort, pageNum } = queryString.parse(query)
    const [pageNumber, setPageNumber] = useState(pageNum ? +pageNum : 1)

    const filterHandler = () => {
        let route = pathname + '?'

        if (sort) route += `&sort=${sort}`

        if (pageNumber !== 1) route += `&pageNum=${pageNumber}`

        history.push(route)
    }

    const loadMoreHandler = () => {
        setPageNumber((previousValue) => previousValue + 1)
    }

    useEffect(() => {
        filterHandler()
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [pageNumber])

    return (
        <Typography
            fontWeight={700}
            sx={{ alignSelf: 'center', mt: 6, color: grey[600], cursor: 'pointer' }}
            onClick={loadMoreHandler}
        >
            Load more activities
        </Typography>
    )
}

export default LoadMore
