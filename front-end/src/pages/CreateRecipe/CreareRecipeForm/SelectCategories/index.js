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
    const handleChange = (value) => {
        const currentIndex = categories.indexOf(value)
        const newCategories = [...categories]
        if (value === CATEGORY_LIST.list[0]) {
            if (currentIndex === -1) {
                CATEGORY_LIST.list.forEach((category) => newCategories.push(category))
            } else {
                CATEGORY_LIST.list.forEach((category) => newCategories.pop(category))
            }
        } else {
            if (currentIndex === -1) {
                newCategories.push(value)
            } else {
                newCategories.splice(currentIndex, 1)
            }
        }
        setCategories(newCategories)
    }

    return (
        <FormControl sx={{ width: 300, mr: 3 }} required size="small">
            <InputLabel id="demo-multiple-checkbox-label">Category</InputLabel>
            <Select
                labelId="demo-multiple-checkbox-label"
                id="demo-multiple-checkbox"
                multiple
                value={categories}
                input={<OutlinedInput label="Category" />}
                renderValue={(selected) => selected.join(', ')}
                MenuProps={MenuProps}
            >
                {CATEGORY_LIST.list.map((name, index) => (
                    <MenuItem key={index} value={name} onClick={() => handleChange(name)}>
                        <Checkbox checked={categories.indexOf(name) > -1} />
                        <ListItemText primary={name} />
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectCategories
