import React from 'react'

import { useRecoilValue } from 'recoil'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

import continentAtom from '../../../../recoil/continents'

const SelectContinents = ({ continents, setContinents }) => {
    const continentList = useRecoilValue(continentAtom)
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
                {continentList.list.map((continent) => (
                    <MenuItem key={continent.id} value={continent.id}>
                        {continent.continents}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectContinents
