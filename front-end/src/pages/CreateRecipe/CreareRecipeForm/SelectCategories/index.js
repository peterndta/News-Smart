import React from 'react'

import {
    Checkbox,
    FormControl,
    InputLabel,
    ListItemText,
    MenuItem,
    OutlinedInput,
    Select,
} from '@mui/material'

import { CATEGORY_LIST } from '../../../../Elixir'

const ITEM_HEIGHT = 48
const ITEM_PADDING_TOP = 8

const MenuProps = {
    PaperProps: {
        style: {
            maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
            width: 250,
        },
    },
}

const SelectCategories = ({ categories, setCategories }) => {
    const handleChange = (event) => {
        const {
            target: { value },
        } = event
        setCategories(typeof value === 'string' ? value.split(',') : value)
    }

    return (
        <FormControl sx={{ m: 1, width: 300 }} required>
            <InputLabel id="demo-multiple-checkbox-label">Tag</InputLabel>
            <Select
                labelId="demo-multiple-checkbox-label"
                id="demo-multiple-checkbox"
                multiple
                value={categories}
                onChange={handleChange}
                input={<OutlinedInput label="Tag" />}
                renderValue={(selected) => selected.join(', ')}
                MenuProps={MenuProps}
            >
                {CATEGORY_LIST.list.map((name, index) => (
                    <MenuItem key={index} value={name}>
                        <Checkbox checked={categories.indexOf(name) > -1} />
                        <ListItemText primary={name} />
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectCategories
