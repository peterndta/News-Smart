import React from 'react'

import { useRecoilValue } from 'recoil'

import {
    Checkbox,
    FormControl,
    InputLabel,
    ListItemText,
    MenuItem,
    OutlinedInput,
    Select,
} from '@mui/material'

import categoryAtom from '../../../../recoil/categories'

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
    const categoryList = useRecoilValue(categoryAtom)

    const handleChange = (value) => {
        const categoriesId = categories.map((cate) => cate.id)
        const currentIndex = categoriesId.indexOf(value.id)
        const newCategories = [...categories]
        if (currentIndex === -1) {
            newCategories.push(value)
        } else {
            newCategories.splice(currentIndex, 1)
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
                value={categories.map((cate) => cate.type)}
                input={<OutlinedInput label="Category" />}
                renderValue={(selected) => selected.join(', ')}
                MenuProps={MenuProps}
            >
                {categoryList.list.map((cate) => (
                    <MenuItem key={cate.id} value={cate.id} onClick={() => handleChange(cate)}>
                        <Checkbox
                            checked={categories.map((cate) => cate.id).indexOf(cate.id) > -1}
                        />
                        <ListItemText primary={cate.type} />
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
    )
}

export default SelectCategories
