import React, { useEffect, useRef, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'
import { useRecoilValue, useSetRecoilState } from 'recoil'

import { Box, CircularProgress, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import { useSnackbar } from '../../../HOCs/SnackbarContext'
import authAtom from '../../../recoil/auth/atom'
import notificationAtom from '../../../recoil/notification'
import useNotification from '../../../recoil/notification/action'
import Loading from '../../Loading'
import Recipes from './Recipes'

const filterStringGenerator = () => {
    let filterString = `?PageSize=${6}`

    return filterString
}
const Mine = () => {
    const { search: query } = useLocation()
    const { sort } = queryString.parse(query)
    const auth = useRecoilValue(authAtom)
    const [recipes, setRecipes] = useState([])
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)
    const [pageNumber, setPageNumber] = useState(1)
    const notificationAction = useNotification()
    const initialLoadingComments = useRef(true)
    const [hasMore, setHasMore] = useState(false)
    const setNotification = useSetRecoilState(notificationAtom)

    const markRead = () => {
        notificationAction.markReadNotifications(+auth.userId).then(() => {
            setNotification({ notification: 0 })
        })
    }

    const loadMoreHandler = () => {
        setPageNumber((previousValue) => previousValue + 1)
    }

    useEffect(() => {
        const params = filterStringGenerator()
        setIsLoading(true)

        if (initialLoadingComments.current) markRead()

        notificationAction
            .getNotifications(+auth.userId, pageNumber, params)
            .then((res) => {
                setHasMore(res.data.meta.hasNext)
                initialLoadingComments.current = false
                const listRecipe = res.data.data
                setRecipes((prev) => [...prev, ...listRecipe])
                setTimeout(() => {
                    setIsLoading(false)
                }, 500)
            })
            .catch((error) => {
                initialLoadingComments.current = false
                const message = error.response.data.message
                showSnackBar({
                    severity: message == 'Do not have any post' ? 'info' : 'error',
                    children: message || 'Something went wrong, please try again later.',
                })
                setTimeout(() => {
                    setIsLoading(false)
                }, 500)
            })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [pageNumber])

    useEffect(() => {
        if (sort === 'Newest') {
            const sortedArray = [...recipes]
            sortedArray.sort(
                (a, b) => new Date(b.createDate).getTime() - new Date(a.createDate).getTime()
            )
            setRecipes(sortedArray)
        } else if (sort === 'Oldest') {
            const sortedArray = [...recipes]
            sortedArray.sort(
                (a, b) => new Date(a.createDate).getTime() - new Date(b.createDate).getTime()
            )
            setRecipes(sortedArray)
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [sort])

    return (
        <React.Fragment>
            {isLoading && initialLoadingComments.current ? (
                <Loading />
            ) : (
                <React.Fragment>
                    {recipes.length ? (
                        <React.Fragment>
                            <Recipes posts={recipes} />
                            {isLoading && (
                                <Box display="flex" justifyContent="center" mt={4}>
                                    <CircularProgress disableShrink size={20} />
                                </Box>
                            )}
                            {hasMore && (
                                <Typography
                                    fontWeight={700}
                                    sx={{
                                        alignSelf: 'center',
                                        mt: 6,
                                        color: grey[600],
                                        cursor: 'pointer',
                                    }}
                                    onClick={loadMoreHandler}
                                >
                                    Load more activities
                                </Typography>
                            )}
                        </React.Fragment>
                    ) : (
                        <Box alignItems="center" textAlign="center" mt={5}>
                            <Typography fontSize={36} fontWeight={700} sx={{ color: grey[600] }}>
                                You currently do not have any notification
                            </Typography>
                            <Typography fontSize={18} mt={3} sx={{ color: grey[700] }}>
                                You will receive a notification when your recipe is deleted
                            </Typography>
                            <Box
                                component="img"
                                alt="food"
                                src="https://scontent.fsgn2-2.fna.fbcdn.net/v/t1.15752-9/262989158_442351117396944_4567609251679745718_n.png?_nc_cat=103&ccb=1-7&_nc_sid=ae9488&_nc_ohc=CceAPHlsMOkAX-4HYRw&_nc_ht=scontent.fsgn2-2.fna&oh=03_AdReiJanTE3qC1KJErOB5k437zczpPH-18OgcO4O9GlPpg&oe=63829E96"
                                sx={{
                                    width: '18%',
                                    opacity: 0.6,
                                }}
                            />
                        </Box>
                    )}
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default Mine
