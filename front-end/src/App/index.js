import { BrowserRouter } from 'react-router-dom'

import { Menu } from '@mui/icons-material'
import { AppBar, Box, Button, IconButton, Toolbar, Typography, useMediaQuery } from '@mui/material'
import { ThemeProvider, useTheme } from '@mui/material/styles'

import Theme from '../theme'
import './App.css'

function App() {
    const theme = useTheme()
    const matches = useMediaQuery(theme.breakpoints.up('lg'))

    return (
        <ThemeProvider theme={Theme}>
            {matches ? (
                <BrowserRouter>
                    <Box sx={{ flexGrow: 1 }}>
                        <AppBar position="static">
                            <Toolbar>
                                <IconButton
                                    size="large"
                                    edge="start"
                                    color="inherit"
                                    aria-label="menu"
                                    sx={{ mr: 2 }}
                                >
                                    <Menu />
                                </IconButton>
                                <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
                                    News
                                </Typography>
                                <Button color="inherit">Login</Button>
                            </Toolbar>
                        </AppBar>
                    </Box>
                </BrowserRouter>
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
