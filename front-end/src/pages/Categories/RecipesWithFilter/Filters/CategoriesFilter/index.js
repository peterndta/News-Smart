import React from 'react'

import { ExpandLess, ExpandMore } from '@mui/icons-material'
import { Checkbox, Collapse, List, ListItemButton, ListItemText } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const CategoriesFilter = ({ categories, checks, selectHandler }) => {
    const [open, setOpen] = React.useState(true)
    const typeList = categories.type

    const handleClick = () => setOpen(!open)

    return (
        <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }} component="nav">
            <ListItemButton onClick={handleClick}>
                <ListItemText
                    primary={categories.type}
                    sx={{
                        '& > span': {
                            fontWeight: 700,
                            color: blueGrey[800],
                            fontSize: 20,
                        },
                    }}
                />
                {open ? <ExpandLess /> : <ExpandMore />}
            </ListItemButton>
            <Collapse in={open} timeout="auto" unmountOnExit>
                <List component="div" disablePadding>
                    {categories.list.map((category, index) => (
                        <ListItemButton
                            key={index}
                            dense
                            onClick={selectHandler(category, typeList)}
                        >
                            <Checkbox
                                edge="start"
                                disableRipple
                                checked={checks.indexOf(category) !== -1}
                            />
                            <ListItemText primary={category} />
                        </ListItemButton>
                    ))}
                </List>
            </Collapse>
        </List>
    )
}

export default CategoriesFilter
