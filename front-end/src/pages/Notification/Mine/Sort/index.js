import React, { useEffect } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

const Sort = () => {
    const history = useHistory()
    const { search: query, pathname } = useLocation()
    const { sort } = queryString.parse(query)
    const [type, setType] = React.useState(sort ? sort : 'Newest')

    const handleChange = (event) => {
        setType(event.target.value)
    }

    const filterHandler = () => {
        let route = pathname + '?'

        if (!!type) route += `&sort=${type}`

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
                <MenuItem value={'Newest'}>Newest</MenuItem>
                <MenuItem value={'Oldest'}>Oldest</MenuItem>
            </Select>
        </FormControl>
    )
}

export default Sort
