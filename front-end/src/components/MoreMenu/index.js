import { useRef, useState } from 'react'

import { Link as RouterLink } from 'react-router-dom'

import { RemoveCircle, Visibility, MoreVert } from '@mui/icons-material'
import { IconButton, ListItemIcon, ListItemText, Menu, MenuItem } from '@mui/material'

const AdminStudentMoreMenu = () => {
    const ref = useRef(null)
    const [isOpen, setIsOpen] = useState(false)

    return (
        <>
            <IconButton ref={ref} onClick={() => setIsOpen(true)}>
                <MoreVert width={20} height={20} />
            </IconButton>

            <Menu
                open={isOpen}
                anchorEl={ref.current}
                onClose={() => setIsOpen(false)}
                PaperProps={{
                    sx: { width: 200, maxWidth: '100%' },
                }}
                anchorOrigin={{ vertical: 'top', horizontal: 'right' }}
                transformOrigin={{ vertical: 'top', horizontal: 'right' }}
            >
                <MenuItem
                    component={RouterLink}
                    to="/user-details"
                    sx={{ color: 'text.secondary' }}
                >
                    <ListItemIcon>
                        <Visibility color="info" />
                    </ListItemIcon>
                    <ListItemText
                        primary="View Profile"
                        primaryTypographyProps={{ variant: 'body2' }}
                    />
                </MenuItem>

                <MenuItem sx={{ color: 'text.secondary' }}>
                    <ListItemIcon>
                        <RemoveCircle color="warning" />
                    </ListItemIcon>
                    <ListItemText
                        primary="Ban Account"
                        primaryTypographyProps={{ variant: 'body2' }}
                    />
                </MenuItem>
            </Menu>
        </>
    )
}

export default AdminStudentMoreMenu
