import React, { useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { Search } from '@mui/icons-material'
import { Box, IconButton, InputBase } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const SearchBox = () => {
    const { search: query, pathname } = useLocation()
    const history = useHistory()
    const { name, status, pageNum } = queryString.parse(query)
    const [searchValue, setSearchValue] = useState(name ? name : '')

    const searchChangeHandler = (event) => {
        const searchText = event.target.value
        setSearchValue(searchText)
    }

    const submitSearchHandler = (event) => {
        if (event.key === 'Enter') {
            let route = pathname + '?'
            if (searchValue) route += '&name=' + searchValue

            if (status !== undefined) route += `&status=${status}`

            if (pageNum) route += `&pageNum=${pageNum}`

            history.push(route)
        }
    }

    return (
        <Box
            sx={{
                p: 0.5,
                display: 'flex',
                alignItems: 'center',
                width: 380,
                border: `1px solid ${blueGrey[200]}`,
                borderRadius: 0.5,
            }}
        >
            <IconButton type="button" sx={{ p: '10px' }} aria-label="search">
                <Search />
            </IconButton>
            <InputBase
                sx={{ ml: 1, flex: 1 }}
                placeholder="Search name"
                inputProps={{ 'aria-label': 'search recipe name' }}
                value={searchValue}
                onChange={searchChangeHandler}
                onKeyDown={submitSearchHandler}
            />
        </Box>
    )
}

export default SearchBox
