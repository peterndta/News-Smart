import React from 'react'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

import { METHOD_LIST } from '../../../../Elixir'

const SelectMethods = ({ method, setMethod }) => {
    const handleChange = (event) => {
        setMethod(event.target.value)
    }

    return (
        <FormControl sx={{ minWidth: 150 }} required size="small">
            <InputLabel id="method">Method</InputLabel>
            <Select
                labelId="method"
                id="method"
                value={method}
                onChange={handleChange}
                autoWidth
                label="Method"
                required
            >
                {METHOD_LIST.list.map((name, index) => (
                    <MenuItem key={index} value={name}>
                        {name}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectMethods
