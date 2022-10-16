import { useEffect } from 'react'

import { BrowserRouter } from 'react-router-dom'
import { useSetRecoilState } from 'recoil'

import { Box, Typography, useMediaQuery } from '@mui/material'
import { ThemeProvider, useTheme } from '@mui/material/styles'

import SnackbarProvider, { useSnackbar } from '../HOCs/SnackbarContext'
import { useAuthAction } from '../recoil/auth'
import categoryAtom, { useCategoryAction } from '../recoil/categories'
import collectionAtom from '../recoil/collection'
import useCollection from '../recoil/collection/action'
import continentAtom, { useContinentsAction } from '../recoil/continents'
import methodAtom, { useMethodsAction } from '../recoil/methods'
import usesAtom, { usesAction } from '../recoil/uses'
import Routes from '../routes'
import Theme from '../theme'
import './App.css'

function App() {
    const authAction = useAuthAction()
    const methodAction = useMethodsAction()
    const continentAction = useContinentsAction()
    const categoryAction = useCategoryAction()
    const useAction = usesAction()
    const collectionAction = useCollection()
    const setCollections = useSetRecoilState(collectionAtom)
    const setMethods = useSetRecoilState(methodAtom)
    const setCategories = useSetRecoilState(categoryAtom)
    const setContinents = useSetRecoilState(continentAtom)
    const setUses = useSetRecoilState(usesAtom)
    const showSnackBar = useSnackbar()

    useEffect(() => {
        methodAction
            .getMethods()
            .then((res) => {
                const data = res.data.data
                setMethods({ type: 'Method', list: data })
            })
            .catch(() => {
                showSnackBar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
            })

        categoryAction
            .getCategories()
            .then((res) => {
                const data = res.data.data
                setCategories({ type: 'Category', list: data })
            })
            .catch(() => {
                showSnackBar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
            })

        continentAction
            .getContinents()
            .then((res) => {
                const data = res.data.data
                setContinents({ type: 'Continent', list: data })
            })
            .catch(() => {
                showSnackBar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
            })

        useAction
            .getUses()
            .then((res) => {
                const data = res.data.data
                setUses({ type: 'Use', list: data })
            })
            .catch(() => {
                showSnackBar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
            })

        collectionAction
            .getCollections()
            .then((res) => {
                const data = res.data.data
                setCollections({ type: 'Collection', list: data })
            })
            .catch(() => {
                showSnackBar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
            })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [])

    authAction.autoLogin()

    const theme = useTheme()
    const matches = useMediaQuery(theme.breakpoints.up('lg'))

    return (
        <ThemeProvider theme={Theme}>
            <SnackbarProvider>
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
            </SnackbarProvider>
        </ThemeProvider>
    )
}

export default App
