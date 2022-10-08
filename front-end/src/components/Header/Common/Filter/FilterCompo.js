import React, { useState } from 'react'

import { ExpandLess, ExpandMore } from '@mui/icons-material'
import { Box, Button, Menu, MenuItem, Typography } from '@mui/material'

const ITEM_HEIGHT = 48

const FilterCompo = ({ filter }) => {
    const [anchorEl, setAnchorEl] = useState(null)
    const open = Boolean(anchorEl)

    const handleClick = (event) => {
        setAnchorEl(event.currentTarget)
    }
    const handleClose = () => {
        setAnchorEl(null)
    }
    return (
        <Box sx={{ ml: 3 }}>
            <Button
                variant="text"
                onClick={handleClick}
                sx={{ color: '#fefefe' }}
                endIcon={open ? <ExpandLess fontSize="large" /> : <ExpandMore fontSize="large" />}
                size="large"
            >
                <Typography variant="h5" sx={{ fontFamily: 'Roboto' }}>
                    {filter.title}
                </Typography>
            </Button>
            <Menu
                MenuListProps={{
                    'aria-labelledby': 'long-button',
                }}
                anchorEl={anchorEl}
                open={open}
                onClose={handleClose}
                PaperProps={{
                    style: {
                        maxHeight: ITEM_HEIGHT * 4.5,
                        width: '20ch',
                    },
                }}
            >
                {filter.list.map((option) => (
                    <MenuItem key={option} selected={option === 'Pyxis'} onClick={handleClose}>
                        {option}
                    </MenuItem>
                ))}
            </Menu>
        </Box>
    )
}

export default FilterCompo
