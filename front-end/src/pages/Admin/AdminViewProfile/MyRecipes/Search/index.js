import React from 'react'

import { Search } from '@mui/icons-material'
import { Box, IconButton, InputBase } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const SearchBox = () => {
    return (
        <Box
            sx={{
                display: 'flex',
                alignItems: 'center',
                width: 380,
                border: `1px solid ${blueGrey[200]}`,
                borderRadius: 0.5,
            }}
        >
            <InputBase
                sx={{ ml: 3, flex: 1 }}
                placeholder="Search recipe name"
                inputProps={{ 'aria-label': 'search recipe name' }}
            />
            <IconButton type="button" sx={{ p: '10px' }} aria-label="search">
                <Search />
            </IconButton>
        </Box>
    )
}

export default SearchBox
