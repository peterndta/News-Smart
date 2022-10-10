import React from 'react'

import { ExpandLess, ExpandMore } from '@mui/icons-material'
import { Checkbox, Collapse, List, ListItemButton, ListItemText } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const ContinentsFilter = ({ continents, checks, selectHandler }) => {
    const [open, setOpen] = React.useState(true)
    const typeList = continents.type

    const handleClick = () => setOpen(!open)

    return (
        <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }} component="nav">
            <ListItemButton onClick={handleClick}>
                <ListItemText
                    primary={continents.type}
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
                    {continents.list.map((continent) => (
                        <ListItemButton
                            key={continent.id}
                            dense
                            onClick={selectHandler(continent.continents, typeList)}
                        >
                            <Checkbox
                                edge="start"
                                disableRipple
                                checked={checks.indexOf(continent.continents) !== -1}
                            />
                            <ListItemText primary={continent.continents} />
                        </ListItemButton>
                    ))}
                </List>
            </Collapse>
        </List>
    )
}

export default ContinentsFilter
