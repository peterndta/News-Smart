import React, { useRef } from 'react'

import { Autocomplete, FormControl, TextField } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const ListAlreadyHad = ({ options, type }) => {
    const transferList = useRef([])
    if (type === 'Category') transferList.current = options.map((option) => option.type)
    else if (type === 'Method') transferList.current = options.map((option) => option.method)
    else if (type === 'Use') transferList.current = options.map((option) => option.usesOfFood)

    return (
        <FormControl
            sx={{
                width: '100%',
                '& label.Mui-focused': {
                    color: blueGrey[800],
                },
                '& .css-1xnpwac-MuiInputBase-root-MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline':
                    {
                        borderColor: blueGrey[800],
                    },
                '& .MuiOutlinedInput-input': {
                    height: '0.8em',
                },
                my: 1.5,
            }}
        >
            <Autocomplete
                value={transferList.current[0]}
                id="controllable-states-demo"
                options={transferList.current}
                renderInput={(params) => <TextField {...params} label="List already had" />}
                getOptionDisabled={() => true}
                sx={{ height: '1.1 em' }}
            />
        </FormControl>
    )
}

export default ListAlreadyHad
