import React from 'react'

import { ExpandLess, ExpandMore } from '@mui/icons-material'
import { Checkbox, Collapse, List, ListItemButton, ListItemText } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const UsesFilter = ({ uses, checks, selectHandler }) => {
    const [open, setOpen] = React.useState(true)
    const typeList = uses.type

    const handleClick = () => setOpen(!open)

    return (
        <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }} component="nav">
            <ListItemButton onClick={handleClick}>
                <ListItemText
                    primary={uses.type}
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
                    {uses.list.map((use) => (
                        <ListItemButton
                            key={use.id}
                            dense
                            onClick={selectHandler(use.id, typeList)}
                        >
                            <Checkbox
                                edge="start"
                                disableRipple
                                checked={checks.indexOf(use.id) !== -1}
                            />
                            <ListItemText primary={use.usesOfFood} />
                        </ListItemButton>
                    ))}
                </List>
            </Collapse>
        </List>
    )
}

export default UsesFilter
