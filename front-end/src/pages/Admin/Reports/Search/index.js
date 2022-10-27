import React, { useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { Search } from '@mui/icons-material'
import { Box, IconButton, InputBase } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const SearchBox = () => {
    const { search: query, pathname } = useLocation()
    const history = useHistory()
    const { search, pageNum } = queryString.parse(query)
    const [searchValue, setSearchValue] = useState(search ? search : '')

    const searchChangeHandler = (event) => {
        const searchText = event.target.value
        setSearchValue(searchText)
    }

    const searchSubmitHandler = (event) => {
        if (event.key === 'Enter') {
            let route = pathname + '?'
            if (searchValue) route += '&search=' + searchValue

            if (pageNum) route += `&pageNum=${pageNum}`

            history.push(route)
        }
    }

    return (
        <Box
            sx={{
                display: 'flex',
                alignItems: 'center',
                width: 380,
                border: `1px solid ${blueGrey[200]}`,
                borderRadius: 0.5,
            }}
        >
            <InputBase
                sx={{ ml: 3, flex: 1 }}
                placeholder="Search recipe name"
                inputProps={{ 'aria-label': 'search recipe name' }}
                onChange={searchChangeHandler}
                onKeyDown={searchSubmitHandler}
            />
            <IconButton type="button" sx={{ p: '10px' }} aria-label="search">
                <Search />
            </IconButton>
        </Box>
    )
}

export default SearchBox
