import React, { useEffect } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

const Sort = () => {
    const history = useHistory()
    const { search: query, pathname } = useLocation()
    const { category, search, sort, pageNum } = queryString.parse(query)
    const [type, setType] = React.useState(sort ? sort : '')

    const handleChange = (event) => {
        setType(event.target.value)
    }

    const filterHandler = () => {
        let route = pathname + '?'
        if (search && search.trim() !== '') route += '&search=' + search

        if (category && Array.isArray(category))
            category.forEach((category) => (route += `&category=${category}`))
        else if (category !== undefined) route += `&category=${category}`

        if (!!type) route += `&sort=${type}`

        if (pageNum) route += `&pageNum=${pageNum}`

        history.push(route)
    }

    useEffect(() => {
        filterHandler()
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [type])

    return (
        <FormControl sx={{ minWidth: 100, alignSelf: 'flex-end' }} size="small">
            <InputLabel id="demo-select-small">Sort</InputLabel>
            <Select
                labelId="demo-select-small"
                id="demo-select-small"
                value={type}
                label="Sort"
                onChange={handleChange}
            >
                <MenuItem value={'Popularity'}>Popularity</MenuItem>
                <MenuItem value={'Newest'}>Newest</MenuItem>
                <MenuItem value={'Oldest'}>Oldest</MenuItem>
            </Select>
        </FormControl>
    )
}

export default Sort
