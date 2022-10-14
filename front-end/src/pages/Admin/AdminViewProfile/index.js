import React from 'react'

import { BookmarkOutlined, Description, StarOutlined } from '@mui/icons-material'
import { Avatar, Box, Divider, Typography } from '@mui/material'
import { blue, blueGrey, grey, red, yellow } from '@mui/material/colors'

import { USER } from '../../../Elixir'
import MyRecipes from './MyRecipes'

const AdminViewProfile = () => {
    return (
        <Box mt={4} mb={14}>
            <Box sx={{ mb: 6 }} display="flex" alignItems="center">
                <Avatar
                    alt="avatar"
                    src={USER.image}
                    sx={{ height: 150, width: 150 }}
                    variant="circular"
                />
                <Box sx={{ ml: 6 }}>
                    <Typography variant="h4" fontWeight={700} sx={{ mb: 1, color: grey[700] }}>
                        {USER.name}
                    </Typography>
                    <Typography fontWeight={700} sx={{ color: blueGrey[800] }} variant="h6">
                        Email: {USER.email}
                    </Typography>
                </Box>
            </Box>
            <Box display="flex" justifyContent="space-around" alignItems="center" px={3}>
                <Box display="flex" alignItems="center">
                    <Description sx={{ width: 50, height: 50, color: red[500] }} />
                    <Box display="flex" flexDirection="column">
                        <Typography component="span" fontWeight={700} sx={{ color: blueGrey[700] }}>
                            {USER.totalRecipe} Recipes
                        </Typography>
                        <Typography component="span" sx={{ color: grey[600] }}>
                            Total recipes posted
                        </Typography>
                    </Box>
                </Box>
                <Box display="flex" alignItems="center">
                    <BookmarkOutlined sx={{ width: 50, height: 50, color: blue[500] }} />
                    <Box display="flex" flexDirection="column">
                        <Typography component="span" fontWeight={700} sx={{ color: blueGrey[700] }}>
                            {USER.totalBookmark} Recipes
                        </Typography>
                        <Typography component="span" sx={{ color: grey[600] }}>
                            Total bookmarks
                        </Typography>
                    </Box>
                </Box>
                <Box display="flex" alignItems="center">
                    <StarOutlined sx={{ width: 50, height: 50, color: yellow[400] }} />
                    <Box display="flex" flexDirection="column">
                        <Typography component="span" fontWeight={700} sx={{ color: blueGrey[700] }}>
                            {USER.totalReview} Recipes
                        </Typography>
                        <Typography component="span" sx={{ color: grey[600] }}>
                            Total stars rated
                        </Typography>
                    </Box>
                </Box>
            </Box>
            <Divider sx={{ background: (theme) => theme.palette.primary.main, height: 3, my: 4 }} />
            <MyRecipes />
        </Box>
    )
}

export default AdminViewProfile
