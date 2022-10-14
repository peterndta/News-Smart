import React, { useEffect, useRef } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

const Sort = () => {
    const history = useHistory()
    const { search: query, pathname } = useLocation()
    const { name, status, pageNum } = queryString.parse(query)
    const [statuses, setType] = React.useState(status)
    const isFirstRender = useRef(true)
    const handleChange = (event) => {
        setType(event.target.value)
    }

    const filterHandler = () => {
        let route = pathname + '?'
        if (name && name.trim() !== '') route += '&name=' + name

        if (statuses === undefined && isFirstRender.current) {
            isFirstRender.current = false
        } else route += `&status=${statuses}`

        if (pageNum) route += `&pageNum=${pageNum}`

        history.push(route)
    }

    useEffect(() => {
        filterHandler()
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [statuses])

    return (
        <FormControl sx={{ minWidth: 100, alignSelf: 'flex-end' }} size="medium">
            <InputLabel id="demo-select-small">Status</InputLabel>
            <Select
                labelId="demo-select-small"
                id="demo-select-small"
                value={statuses}
                label="Status"
                onChange={handleChange}
            >
                <MenuItem value={true}>Active</MenuItem>
                <MenuItem value={false}>Ban</MenuItem>
            </Select>
        </FormControl>
    )
}

export default Sort
