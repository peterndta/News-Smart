import React from 'react'

import { NavLink } from 'react-router-dom'

// import { NavLink } from 'react-router-dom'
import { AccountCircle, Bookmark, Description, StarRateOutlined } from '@mui/icons-material'
// import { Drafts, Inbox } from '@mui/icons-material'
import {
    Avatar,
    Box,
    List,
    ListItem,
    ListItemButton,
    ListItemIcon,
    ListItemText,
    Typography,
} from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import BTH from '../../assets/members/BTH.jpg'

const Navs = () => {
    return (
        <Box
            sx={{
                width: '100%',
                maxWidth: 360,
                bgcolor: 'background.paper',
                border: `1px solid ${grey[800]}`,
            }}
        >
            <Box
                display="flex"
                alignItems="center"
                px={2}
                py={1}
                sx={{ borderBottom: `1px solid ${grey[800]}` }}
            >
                <Avatar variant="square" src={BTH} sx={{ width: 50, height: 50 }} />
                <Box display="flex" flexDirection="column" ml={1.5}>
                    <Typography component="span" fontWeight={700} sx={{ color: blueGrey[900] }}>
                        Hi,
                    </Typography>
                    <Typography component="span" fontWeight={700} sx={{ color: blueGrey[900] }}>
                        Hienbui25g@gmail.com
                    </Typography>
                </Box>
            </Box>
            <List sx={{ py: 0 }}>
                <ListItem disablePadding sx={{ borderBottom: `1px solid ${grey[800]}` }}>
                    <ListItemButton component={NavLink} to="/profile">
                        <ListItemIcon sx={{ minWidth: 35 }}>
                            <AccountCircle color="secondary" />
                        </ListItemIcon>
                        <ListItemText primary="Personal Info" sx={{ fontWeight: 500 }} />
                    </ListItemButton>
                </ListItem>
                <ListItem disablePadding sx={{ borderBottom: `1px solid ${grey[800]}` }}>
                    <ListItemButton component={NavLink} to="/bookmark">
                        <ListItemIcon sx={{ minWidth: 35 }}>
                            <Bookmark color="secondary" />
                        </ListItemIcon>
                        <ListItemText primary="Saved recipes" sx={{ fontWeight: 500 }} />
                    </ListItemButton>
                </ListItem>
                <ListItem disablePadding sx={{ borderBottom: `1px solid ${grey[800]}` }}>
                    <ListItemButton component={NavLink} to="/my-rating">
                        <ListItemIcon sx={{ minWidth: 35 }}>
                            <StarRateOutlined color="secondary" />
                        </ListItemIcon>
                        <ListItemText primary="Your rating" sx={{ fontWeight: 500 }} />
                    </ListItemButton>
                </ListItem>
                <ListItem disablePadding>
                    <ListItemButton component={NavLink} to="/my-recipes">
                        <ListItemIcon sx={{ minWidth: 35 }}>
                            <Description color="secondary" />
                        </ListItemIcon>
                        <ListItemText primary="Your recipes" sx={{ fontWeight: 500 }} />
                    </ListItemButton>
                </ListItem>
            </List>
        </Box>
    )
}

export default Navs
