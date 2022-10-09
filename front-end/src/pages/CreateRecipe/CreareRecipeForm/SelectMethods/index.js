import React from 'react'

import { useRecoilValue } from 'recoil'

import { FormControl, InputLabel, MenuItem, Select } from '@mui/material'

import methodAtom from '../../../../recoil/methods'

const SelectMethods = ({ method, setMethod }) => {
    const methodList = useRecoilValue(methodAtom)
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
                {methodList.list.map((method) => (
                    <MenuItem key={method.id} value={method.id}>
                        {method.method}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectMethods
