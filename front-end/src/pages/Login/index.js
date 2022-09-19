import { useState } from 'react'

import GoogleButton from '../../components/Buttons/GoogleButton'
import Carousel from '../../components/Carousel'
import Copyright from '../../components/Copyright'
import { Typography, Grid, CssBaseline, Box, Avatar, Paper } from '@mui/material'

import Logo from '../../assets/images/logo.png'
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
        src: 'https://scontent.fsgn2-5.fna.fbcdn.net/v/t1.15752-9/305100729_1981886925339506_596451334788749172_n.png?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_ohc=l-qiPfrLCOkAX947wSM&tn=c1NGR-hXQErPv9Vx&_nc_ht=scontent.fsgn2-5.fna&oh=03_AVLZaV_iyNx7MEtkQf8jG7ljoh6nu82AQ9nwdUlqsWOQWQ&oe=634E8634',
        size: 'contain',
    },
    {
        src: 'https://i.pinimg.com/564x/04/8b/68/048b682cb52b29d077c68c9fc2a6e17f.jpg',
        size: 'contain',
    },
]

const Login = () => {
    const [isLoading, setIsLoading] = useState(false)

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
                    <Avatar src={Logo} alt="SEEMS logo" sx={{ width: 200, height: 80 }}></Avatar>
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
                        <GoogleButton />
                    </Box>
                </Box>
                <Copyright />
            </Grid>
        </Grid>
    )
}

export default Login
