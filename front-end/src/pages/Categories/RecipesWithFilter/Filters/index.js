import React, { useEffect, useRef, useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import { Box, Button, Grid, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import categoryAtom from '../../../../recoil/categories'
import CategoriesFilter from './CategoriesFilter'

const Filter = () => {
    const categoryList = useRecoilValue(categoryAtom)
    const { search: query, pathname } = useLocation()
    const { search, category, sort, pageNum } = queryString.parse(query)
    const history = useHistory()
    const [categories, setCategories] = useState(category ? category : [])
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
        setCategories([])
        isClearAll.current = true
    }

    const searchSubmitHandler = () => {
        let route = pathname + '?'
        if (search && search.trim() !== '') route += '&search=' + search

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
                        Select
                    </Typography>
                    <Button variant="outlined" onClick={clearAllHandler}>
                        Clear all
                    </Button>
                </Box>

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
