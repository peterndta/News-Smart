import React, { useEffect, useRef, useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import {
    Box,
    Button,
    Divider,
    FormControl,
    Grid,
    InputLabel,
    OutlinedInput,
    Typography,
} from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import categoryAtom from '../../../../recoil/categories'
import CategoriesFilter from './CategoriesFilter'

const Filter = () => {
    const categoryList = useRecoilValue(categoryAtom)
    const { search: query, pathname } = useLocation()
    const { search, category, sort, pageNum } = queryString.parse(query)
    const history = useHistory()
    const [categories, setCategories] = useState(category ? category : [])
    const [searchValue, setSearchValue] = useState(search ? search : '')
    const isClearAll = useRef(false)

    const selectHandler = (value) => () => {
        const newCategories = [...categories]
        const currentIndex = categories.indexOf(value)
        if (currentIndex === -1) {
            newCategories.push(value)
        } else {
            newCategories.splice(currentIndex, 1)
        }

        setCategories(newCategories)
        isClearAll.current = false
    }

    const clearAllHandler = () => {
        setSearchValue('')
        setCategories([])
        isClearAll.current = true
    }

    const searchChangeHandler = (event) => {
        const searchText = event.target.value
        setSearchValue(searchText)
        isClearAll.current = false
    }

    const searchSubmitHandler = () => {
        let route = pathname + '?'
        if (searchValue) route += '&search=' + searchValue

        if (categories.length !== 0)
            categories.forEach((category) => (route += `&category=${category}`))

        if (sort) route += `&sort=${sort}`

        if (pageNum) route += `&pageNum=${pageNum}`

        history.push(route)
    }

    useEffect(() => {
        if (isClearAll.current === true) searchSubmitHandler()

        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [isClearAll.current === false])

    return (
        <Grid item md={3}>
            <Box p={3} sx={{ border: `1px solid ${blueGrey[200]}`, borderRadius: 1 }}>
                <Box
                    display="flex"
                    justifyContent="space-between"
                    alignItems="center"
                    pb={1}
                    sx={{ borderBottom: (theme) => `3px solid ${theme.palette.primary.main}` }}
                >
                    <Typography variant="h4" fontWeight={700} sx={{ color: blueGrey[800] }}>
                        Filters
                    </Typography>
                    <Button variant="outlined" onClick={clearAllHandler}>
                        Clear all
                    </Button>
                </Box>
                <Box mt={3} mb={1}>
                    <Typography variant="h6" fontWeight={700} sx={{ color: blueGrey[800] }} mb={2}>
                        Recipe or keyword
                    </Typography>

                    <FormControl
                        sx={{
                            width: '100%',
                            '& label.Mui-focused': {
                                color: blueGrey[800],
                            },
                            '& .css-1xnpwac-MuiInputBase-root-MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline':
                                {
                                    borderColor: blueGrey[800],
                                },
                            '& .MuiOutlinedInput-input': {
                                height: '0.8em',
                            },
                        }}
                    >
                        <InputLabel htmlFor="component-outlined" sx={{ top: -5 }}>
                            Keyword
                        </InputLabel>
                        <OutlinedInput
                            id="component-outlined"
                            label="Keyword"
                            value={searchValue}
                            onChange={searchChangeHandler}
                        />
                    </FormControl>
                </Box>
                <Divider
                    sx={{
                        backgroundColor: (theme) => theme.palette.primary.main,
                        height: 2,
                        mt: 2,
                    }}
                />
                <CategoriesFilter
                    categories={categoryList}
                    checks={categories}
                    selectHandler={selectHandler}
                />

                <Box width="100%" display="flex" justifyContent="center" mt={3}>
                    <Button
                        variant="contained"
                        sx={{ color: grey[100] }}
                        onClick={searchSubmitHandler}
                    >
                        SHOW RESULTS
                    </Button>
                </Box>
            </Box>
        </Grid>
    )
}

export default Filter
