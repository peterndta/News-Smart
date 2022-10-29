import React, { useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { Search } from '@mui/icons-material'
import { Box, IconButton, InputBase } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const SearchBox = () => {
    const { search: query, pathname } = useLocation()
    const history = useHistory()
    const { search, sort, pageNum, use, continent } = queryString.parse(query)
    const [searchValue, setSearchValue] = useState(search ? search : '')

    const searchChangeHandler = (event) => {
        const searchText = event.target.value
        setSearchValue(searchText)
    }

    const searchSubmitHandler = (event) => {
        if (event.key === 'Enter') {
            let route = pathname + '?'
            if (searchValue && searchValue.trim() !== '') route += '&search=' + searchValue

            if (continent && Array.isArray(continent))
                continent.forEach((continent) => (route += `&continent=${continent}`))
            else if (continent !== undefined) route += `&continent=${continent}`

            if (Array.isArray(use) && use?.length !== 0)
                use?.forEach((use) => (route += `&use=${use}`))
            else if (use !== undefined) route += `&use=${use}`

            if (sort) route += `&sort=${sort}`

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
                width: 400,
                border: `1px solid ${blueGrey[200]}`,
                borderRadius: 0.5,
            }}
        >
            <IconButton type="button" sx={{ p: '10px' }} aria-label="search">
                <Search />
            </IconButton>
            <InputBase
                sx={{ ml: 1, flex: 1 }}
                placeholder="Search recipe name"
                inputProps={{ 'aria-label': 'search recipe name' }}
                onChange={searchChangeHandler}
                onKeyDown={searchSubmitHandler}
                size="small"
            />
        </Box>
    )
}

export default SearchBox
