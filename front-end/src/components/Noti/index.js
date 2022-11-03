import React from 'react'

import { Link } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import { Notifications } from '@mui/icons-material'
import { Badge, Box, IconButton } from '@mui/material'

import notificationAtom from '../../recoil/notification'

const Notification = () => {
    const notification = useRecoilValue(notificationAtom)

    return (
        <Box component={Link} to="/notification" sx={{ textDecoration: ' none' }}>
            <IconButton component="label" size="large" sx={{ ml: 3 }}>
                <Badge badgeContent={notification.notification} color="secondary" max={99}>
                    <Notifications fontSize="large" sx={{ color: '#fefefe' }} />
                </Badge>
            </IconButton>
        </Box>
    )
}

export default Notification
