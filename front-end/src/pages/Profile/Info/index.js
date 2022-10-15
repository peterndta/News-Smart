import React, { useEffect, useState } from 'react'

import { Link } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import { BookmarkOutlined, Description, StarOutlined } from '@mui/icons-material'
import { Avatar, Box, Divider, Typography } from '@mui/material'
import { blue, blueGrey, grey, red, yellow } from '@mui/material/colors'

// import { USER } from '../../../Elixir'
import { useSnackbar } from '../../../HOCs/SnackbarContext'
import Loading from '../../../pages/Loading'
import authAtom from '../../../recoil/auth/atom'
import { useMyProfile } from '../../../recoil/profile'
import MyRecipes from './MyRecipes'

const Info = () => {
    const auth = useRecoilValue(authAtom)
    const [activity, setActivity] = useState({})
    const { getActivity } = useMyProfile()
    const showSnackbar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)

    useEffect(() => {
        setIsLoading(true)
        getActivity(auth.userId)
            .then((response) => {
                const data = response.data.data
                setActivity(data)
                setIsLoading(false)
            })
            .catch(() => {
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
                setIsLoading(false)
            })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [])
    return (
        <React.Fragment>
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <Box pl={6}>
                        <Box sx={{ mb: 6 }} display="flex" alignItems="center">
                            <Avatar
                                alt="avatar"
                                src={auth.image}
                                sx={{ height: 150, width: 150 }}
                                variant="circular"
                            />
                            <Box sx={{ ml: 6 }}>
                                <Typography
                                    variant="h4"
                                    fontWeight={700}
                                    sx={{ mb: 1, color: grey[700] }}
                                >
                                    {auth.name}
                                </Typography>
                                <Typography
                                    fontWeight={700}
                                    sx={{ color: blueGrey[800] }}
                                    variant="h6"
                                >
                                    Email: {auth.email}
                                </Typography>
                            </Box>
                        </Box>
                        <Box
                            display="flex"
                            justifyContent="space-around"
                            alignItems="center"
                            px={3}
                        >
                            <Box display="flex" alignItems="center">
                                <Link to="/recipes/me">
                                    <Description
                                        to="/recipes/me"
                                        sx={{
                                            width: 50,
                                            height: 50,
                                            color: red[500],
                                            cursor: 'pointer',
                                        }}
                                    />
                                </Link>
                                <Box display="flex" flexDirection="column">
                                    <Typography
                                        component="span"
                                        fontWeight={700}
                                        sx={{ color: blueGrey[700] }}
                                    >
                                        {activity.totalPosts} Recipes
                                    </Typography>
                                    <Typography component="span" sx={{ color: grey[600] }}>
                                        Total recipes posted
                                    </Typography>
                                </Box>
                            </Box>
                            <Box display="flex" alignItems="center">
                                <Link to="/recipes/bookmark">
                                    <BookmarkOutlined
                                        sx={{
                                            width: 50,
                                            height: 50,
                                            color: blue[500],
                                            cursor: 'pointer',
                                        }}
                                    />
                                </Link>
                                <Box display="flex" flexDirection="column">
                                    <Typography
                                        component="span"
                                        fontWeight={700}
                                        sx={{ color: blueGrey[700] }}
                                    >
                                        {activity.totalBookmarks} Recipes
                                    </Typography>
                                    <Typography component="span" sx={{ color: grey[600] }}>
                                        Total bookmarks
                                    </Typography>
                                </Box>
                            </Box>
                            <Box display="flex" alignItems="center">
                                <Link to="/recipes/my-ratings">
                                    <StarOutlined
                                        sx={{
                                            width: 50,
                                            height: 50,
                                            color: yellow[400],
                                            cursor: 'pointer',
                                        }}
                                    />
                                </Link>
                                <Box display="flex" flexDirection="column">
                                    <Typography
                                        component="span"
                                        fontWeight={700}
                                        sx={{ color: blueGrey[700] }}
                                    >
                                        {activity.totalRatings} Recipes
                                    </Typography>
                                    <Typography component="span" sx={{ color: grey[600] }}>
                                        Total stars rated
                                    </Typography>
                                </Box>
                            </Box>
                        </Box>
                        <Divider
                            sx={{
                                background: (theme) => theme.palette.primary.main,
                                height: 3,
                                my: 4,
                            }}
                        />
                        <MyRecipes />
                    </Box>
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default Info
