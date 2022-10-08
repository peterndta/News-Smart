import React from 'react'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

import { CONTINENTS_LIST } from '../../../../Elixir'

const SelectContinents = ({ continents, setContinents }) => {
    const handleChange = (event) => {
        setContinents(event.target.value)
    }

    return (
        <FormControl sx={{ minWidth: 150, ml: 3 }} required size="small">
            <InputLabel id="continent">Continents</InputLabel>
            <Select
                labelId="continent"
                id="method"
                value={continents}
                onChange={handleChange}
                autoWidth
                label="Continents"
                required
            >
                {CONTINENTS_LIST.list.map((name, index) => (
                    <MenuItem key={index} value={name}>
                        {name}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectContinents
