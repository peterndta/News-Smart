import React from 'react'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

import { USES_LIST } from '../../../../Elixir'

const SelectUses = ({ uses, setUses }) => {
    const handleChange = (event) => {
        setUses(event.target.value)
    }

    return (
        <FormControl sx={{ minWidth: 150, ml: 3 }} required size="small">
            <InputLabel id="uses">Uses</InputLabel>
            <Select
                labelId="uses"
                id="method"
                value={uses}
                onChange={handleChange}
                autoWidth
                label="Uses"
                required
            >
                {USES_LIST.list.map((name, index) => (
                    <MenuItem key={index} value={name}>
                        {name}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectUses
