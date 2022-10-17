import React, { useState } from 'react'

import { TextField } from '@mui/material'

const isEmpty = (incomeValue) => incomeValue.trim().length === 0

const InputName = ({ type, submitHandler }) => {
    const [value, setValue] = useState({ value: '', isTouched: false })

    const valueChangeHandler = (event) => {
        setValue((previousValue) => ({ ...previousValue, value: event.target.value }))
    }

    const valueTouchedHandler = () => {
        setValue((previousValue) => ({ ...previousValue, isTouched: true }))
    }

    const valueIsInvalid = isEmpty(value.value) && value.isTouched

    return (
        <TextField
            placeholder={
                type === 'Method'
                    ? 'e.g. Fry'
                    : type === 'Category'
                    ? 'e.g. Meat'
                    : 'e.g. Beautiful Skin'
            }
            inputProps={{ 'aria-label': 'create name' }}
            value={value.value}
            label="Name"
            onChange={valueChangeHandler}
            onBlur={valueTouchedHandler}
            size="small"
            sx={{ mt: 1.5, width: '100%' }}
            helperText={valueIsInvalid ? 'Name must not be empty' : ''}
            error={valueIsInvalid}
            onKeyDown={(event) => submitHandler(event, value.value)}
        />
    )
}

export default InputName
