import { useEffect, useState } from 'react'

import queryString from 'query-string'
import { Link, useLocation } from 'react-router-dom'

import GoogleButton from '../../components/Buttons/GoogleButton'
import Carousel from '../../components/Carousel'
import Copyright from '../../components/Copyright'
import HomeIcon from '@mui/icons-material/Home'
import { Typography, Grid, CssBaseline, Box, Avatar, Paper } from '@mui/material'
import { grey } from '@mui/material/colors'

import { useSnackbar } from '../../HOCs/SnackbarContext'
import Logo from '../../assets/images/logo.png'
import { APP_API_URL } from '../../config'
import { useAuthAction } from '../../recoil/auth'
import Loading from '../Loading'

const imageList = [
    {
        src: 'https://i.pinimg.com/564x/d9/29/56/d92956dbc1695426300ea0981122d2d0.jpg',
        size: 'cover',
    },
    {
        src: 'https://i.pinimg.com/564x/7e/5f/4b/7e5f4b5f9335eb48ad7de2941ccbe388.jpg',
        size: 'contain',
    },
    {
        src: 'https://www.expatica.com/app/uploads/sites/11/2014/05/russian-cuisine.jpg',
        size: 'contain',
    },
    {
        src: 'https://i.pinimg.com/564x/04/8b/68/048b682cb52b29d077c68c9fc2a6e17f.jpg',
        size: 'contain',
    },
]

const Login = () => {
    const { search } = useLocation()
    const authAction = useAuthAction()
    const { token, error } = queryString.parse(search)
    const [isLoading, setIsLoading] = useState(token ? true : false)
    const showSnackbar = useSnackbar()

    const googleClickHandler = () => {
        window.location.assign(`${APP_API_URL}/api/Authentication`)
    }

    useEffect(() => {
        if (error && error === 'inactive-user') {
            showSnackbar({
                severity: 'error',
                children: 'Your email is banned, please contact Admin to unban.',
            })
        } else if (error) {
            showSnackbar({
                severity: 'error',
                children: 'Something went wrong, please try again later.',
            })
        } else if (token) {
            authAction.login(token).catch(() => {
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
                setIsLoading(false)
            })
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [])

    return isLoading ? (
        <Loading />
    ) : (
        <Grid container component="main" height="100vh" overflow="hidden">
            <CssBaseline />
            <Grid item xs={0} sm={4} md={7} position="relative" overflow="hidden">
                <Carousel imageList={imageList} />
            </Grid>
            <Grid
                item
                xs={12}
                sm={8}
                md={5}
                display="flex"
                flexDirection="column"
                justifyContent="center"
                alignItems="center"
                component={Paper}
                elevation={12}
                square
            >
                <Box mt={2}>
                    <Link to="/">
                        <HomeIcon fontSize="large" sx={{ color: grey[800] }} />
                    </Link>
                </Box>
                <Box
                    sx={{
                        my: 6,
                        mx: 4,
                        flexGrow: 1,
                        display: 'flex',
                        flexDirection: 'column',
                        justifyContent: 'center',
                        alignItems: 'center',
                    }}
                >
                    <Link to="/">
                        <Avatar src={Logo} alt="Reci logo" sx={{ width: 200, height: 80 }}></Avatar>
                    </Link>
                    <Typography
                        variant="h5"
                        textAlign="center"
                        fontWeight={400}
                        fontFamily="monospace"
                        fontSize={34}
                        mt={1.5}
                    >
                        Best place for sharing and learning recipes.
                    </Typography>
                    <Typography
                        component="h1"
                        variant="h4"
                        textAlign="center"
                        color="primary.main"
                        mt={3}
                    >
                        Start the <strong>day</strong> with a better <strong>taste!</strong>
                    </Typography>
                    <Box sx={{ mt: 1 }}>
                        <GoogleButton onClick={googleClickHandler} />
                    </Box>
                </Box>
                <Copyright />
            </Grid>
        </Grid>
    )
}

export default Login
