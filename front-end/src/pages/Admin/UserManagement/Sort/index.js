import React, { useEffect } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

const Sort = () => {
    const history = useHistory()
    const { search: query, pathname } = useLocation()
    const { search, sort, pageNum } = queryString.parse(query)
    const [status, setType] = React.useState(sort ? sort : '')

    const handleChange = (event) => {
        setType(event.target.value)
    }

    const filterHandler = () => {
        let route = pathname + '?'
        if (search && search.trim() !== '') route += '&search=' + search

        if (!!status) route += `&sort=${status}`

        if (pageNum) route += `&pageNum=${pageNum}`

        history.push(route)
    }

    useEffect(() => {
        filterHandler()
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [status])

    return (
        <FormControl sx={{ minWidth: 100, alignSelf: 'flex-end' }} size="medium">
            <InputLabel id="demo-select-small">Status</InputLabel>
            <Select
                labelId="demo-select-small"
                id="demo-select-small"
                value={status}
                label="Status"
                onChange={handleChange}
            >
                <MenuItem value={'Valid'}>Active</MenuItem>
                <MenuItem value={'Invalid'}>Ban</MenuItem>
            </Select>
        </FormControl>
    )
}

export default Sort
