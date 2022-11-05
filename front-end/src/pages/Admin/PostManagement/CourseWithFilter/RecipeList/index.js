import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

import { Box, Grid, Typography } from '@mui/material'
import { grey } from '@mui/material/colors'

import { useSnackbar } from '../../../../../HOCs/SnackbarContext'
import { useCollection } from '../../../../../recoil/collection'
import Loading from '../../../../Loading'
import Paging from '../Pagination'
import SearchBox from '../Search'
import Sort from '../Sort'
import Recipes from './RecipesCompo'

const filterStringGenerator = ({ search, collection, sort }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    if (collection === undefined) filterString += `&collection=Breakfast`
    else filterString += `&collection=${collection}`

    if (sort !== undefined) filterString += `&sort=${sort}`

    return filterString
}

const RecipeList = () => {
    const { search: query } = useLocation()
    const { sort, collection, pageNum, search } = queryString.parse(query)
    const collectionAction = useCollection()
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const showSnackBar = useSnackbar()
    const [isLoading, setIsLoading] = useState(false)

    useEffect(() => {
        const params = filterStringGenerator({ search, collection, sort })
        setIsLoading(true)

        if (pageNum === undefined)
            collectionAction
                .getRecipesWithCollection(params)
                .then((res) => {
                    const listRecipe = res.data.data
                    const { totalPages } = res.data.meta
                    setRecipes({ list: listRecipe, pageCount: totalPages })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
                .catch(() => {
                    showSnackBar({
                        severity: 'error',
                        children: 'Something went wrong, please try again later.',
                    })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
        else
            collectionAction
                .getRecipesWithCollection(params, pageNum)
                .then((res) => {
                    const listRecipe = res.data.data
                    const { totalPages } = res.data.meta
                    setRecipes({ list: listRecipe, pageCount: totalPages })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
                .catch(() => {
                    showSnackBar({
                        severity: 'error',
                        children: 'Something went wrong, please try again later.',
                    })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [sort, pageNum, collection, search])

    return (
        <Grid item md={9} display="flex" flexDirection="column">
            {isLoading ? (
                <Loading />
            ) : (
                <React.Fragment>
                    <Box display="flex" justifyContent="space-between" alignItems="center">
                        <SearchBox />
                        <Sort />
                    </Box>
                    {recipes.list.length ? (
                        <React.Fragment>
                            <Recipes posts={recipes.list} />
                            {recipes.pageCount !== 1 && <Paging size={recipes.pageCount} />}
                        </React.Fragment>
                    ) : (
                        <Box alignItems="center" textAlign="center" mt={10}>
                            <Typography fontSize={38} fontWeight={700} sx={{ color: grey[700] }}>
                                Sorry, we couldn&apos;t find any results
                            </Typography>
                            <Typography fontSize={20} mt={3} sx={{ color: grey[700] }}>
                                Feel free to add your own recipe by clicking{' '}
                                <Box component="span" fontWeight={700}>
                                    Add A Recipe{' '}
                                </Box>
                                on your profile menu
                            </Typography>
                            <Box
                                mt={4}
                                component="img"
                                alt="food"
                                src="https://scontent.fsgn2-6.fna.fbcdn.net/v/t1.15752-9/307589926_834744197705463_2982451241580080174_n.png?_nc_cat=111&ccb=1-7&_nc_sid=ae9488&_nc_ohc=YAQCDp9K8pkAX9rl9-z&_nc_ht=scontent.fsgn2-6.fna&oh=03_AdRFe2c-TMn6SeEmCClPqnvxknL6sOrF1rmtO59ij8T4wQ&oe=6378DC07"
                                sx={{
                                    width: '20%',
                                }}
                            />
                        </Box>
                    )}
                </React.Fragment>
            )}
        </Grid>
    )
}

export default RecipeList
