import React from 'react'

import { ExpandLess, ExpandMore } from '@mui/icons-material'
import { Checkbox, Collapse, List, ListItemButton, ListItemText } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const MethodsFilter = ({ methods, checks, selectHandler }) => {
    const [open, setOpen] = React.useState(true)
    const typeList = methods.type

    const handleClick = () => setOpen(!open)

    return (
        <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }} component="nav">
            <ListItemButton onClick={handleClick}>
                <ListItemText
                    primary={methods.type}
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
                    {methods.list.map((method, index) => (
                        <ListItemButton key={index} dense onClick={selectHandler(method, typeList)}>
                            <Checkbox
                                edge="start"
                                disableRipple
                                checked={checks.indexOf(method) !== -1}
                            />
                            <ListItemText primary={method} />
                        </ListItemButton>
                    ))}
                </List>
            </Collapse>
        </List>
    )
}

export default MethodsFilter
