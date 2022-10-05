import { BrowserRouter } from 'react-router-dom'

import { Box, Typography, useMediaQuery } from '@mui/material'
import { ThemeProvider, useTheme } from '@mui/material/styles'

import { useAuthAction } from '../recoil/auth'
import Routes from '../routes'
import Theme from '../theme'
import './App.css'

function App() {
    const authAction = useAuthAction()
    authAction.autoLogin()

    const theme = useTheme()
    const matches = useMediaQuery(theme.breakpoints.up('lg'))

    return (
        <ThemeProvider theme={Theme}>
            {matches ? (
                <BrowserRouter>{Routes}</BrowserRouter>
            ) : (
                <Box
                    display="flex"
                    height="100vh"
                    flexDirection="column"
                    justifyContent="center"
                    alignItems="center"
                    m={3}
                >
                    <Typography variant="body1" textAlign="center" color="primary">
                        This application does not support small view,
                    </Typography>
                    <Typography variant="body1" textAlign="center" color="secondary">
                        Please use Desktop view to have the best experience!
                    </Typography>
                </Box>
            )}
        </ThemeProvider>
    )
}

export default App
