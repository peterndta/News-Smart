import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import NumberItemPagination from '../../../components/NumberItemPagination'
import { Search } from '@mui/icons-material'
import {
    Box,
    FormControl,
    IconButton,
    InputBase,
    InputLabel,
    MenuItem,
    Pagination,
    Select,
} from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import { useSnackbar } from '../../../HOCs/SnackbarContext'
// import { MOST_FAVORITE_POSTS } from '../../../Elixir'
import authAtom from '../../../recoil/auth/atom'
import { useMyRecipe } from '../../../recoil/my-recipe'
import Loading from '../../Loading'
import Recipes from './Recipes'

const Mine = () => {
    // const history = useHistory()
    const auth = useRecoilValue(authAtom)
    const { search: query, pathname } = useLocation()
    const { search, sort, pageNum } = queryString.parse(query)
    const [isLoading, setIsLoading] = useState(false)
    const [type, setType] = React.useState(sort ? sort : '')
    const [pageNumber, setPageNumber] = useState(1)
    const [searchValue, setSearchValue] = useState(search ? search : '')
    const [recipes, setRecipes] = useState({ list: [], pageCount: 1 })
    const pagingHandler = (__, value) => setPageNumber(value)
    const { getRecipes } = useMyRecipe()
    const showSnackBar = useSnackbar()
    const searchChangeHandler = (event) => {
        const searchText = event.target.value.trim()
        setSearchValue(searchText)
    }
    const handleChange = (event) => {
        setType(event.target.value)
    }

    useEffect(() => {
        setIsLoading(true)

        getRecipes(searchValue, auth.userId, pageNumber, type)
            .then((res) => {
                console.log(res.data)
                const listRecipe = res.data.data
                const { totalPages } = res.data.meta
                setRecipes({ list: listRecipe, pageCount: totalPages })
                setIsLoading(false)
            })
            .catch((error) => {
                showSnackBar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                })
                setIsLoading(false)
            })

        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [type, pageNumber, searchValue])

    return (
        <React.Fragment>
            {isLoading ? (
                <Loading />
            ) : (
                <Box>
                    <Box display="flex" justifyContent="space-between" alignItems="center">
                        <Box
                            component="form"
                            sx={{
                                p: 0.5,
                                display: 'flex',
                                alignItems: 'center',
                                width: 400,
                                border: `1px solid ${blueGrey[200]}`,
                                borderRadius: 0.5,
                            }}
                        >
                            <IconButton type="button" sx={{ p: '10px' }} aria-label="search">
                                <Search />
                            </IconButton>
                            <InputBase
                                sx={{ ml: 1, flex: 1 }}
                                value={searchValue}
                                onChange={searchChangeHandler}
                                placeholder="Search recipe name"
                                inputProps={{ 'aria-label': 'search recipe name' }}
                            />
                        </Box>
                        <FormControl sx={{ minWidth: 100, alignSelf: 'flex-end' }} size="medium">
                            <InputLabel id="demo-select-small">Type</InputLabel>
                            <Select
                                labelId="demo-select-small"
                                id="demo-select-small"
                                value={type}
                                label="Type"
                                onChange={handleChange}
                            >
                                <MenuItem value={'Popularity'}>Popularity</MenuItem>
                                <MenuItem value={'Newest'}>Newest</MenuItem>
                                <MenuItem value={'Oldest'}>Oldest</MenuItem>
                            </Select>
                        </FormControl>
                    </Box>
                    <NumberItemPagination from={1} to={6} all={15} />
                    <Recipes posts={recipes.list} />
                    <Pagination
                        count={10}
                        onChange={pagingHandler}
                        variant="outlined"
                        sx={{ alignSelf: 'center', mt: 6 }}
                        page={pageNumber}
                    />
                </Box>
            )}
        </React.Fragment>
    )
}

export default Mine
