import React from 'react'

import { useRecoilValue } from 'recoil'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

import usesAtom from '../../../../recoil/uses'

const SelectUses = ({ uses, setUses }) => {
    const useList = useRecoilValue(usesAtom)
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
                {useList.list.map((use) => (
                    <MenuItem key={use.id} value={use.id}>
                        {use.usesOfFood}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectUses
