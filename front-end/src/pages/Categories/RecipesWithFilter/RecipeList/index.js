import React, { useEffect } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'

import { FormControl, Grid, InputLabel, MenuItem, Pagination, Select } from '@mui/material'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import Recipes from './RecipesCompo'

const RecipeList = () => {
    const history = useHistory()
    const { search: query, pathname } = useLocation()
    const { search, time, category } = queryString.parse(query)
    const [type, setType] = React.useState(time ? time : '')

    const handleChange = (event) => {
        setType(event.target.value)
    }

    const filterHandler = () => {
        let route = pathname + '?'
        if (search) route += '&search=' + search

        if (category?.length !== 0)
            category?.forEach((category) => (route += `&category=${category}`))

        if (!!type) {
            if (type === 'Popularity') route += `&status=${type}`
            else route += `&time=${type}`
        }

        history.push(route)
    }

    useEffect(() => {
        filterHandler()
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [type])

    return (
        <Grid item md={9} display="flex" flexDirection="column">
            <FormControl sx={{ minWidth: 100, alignSelf: 'flex-end' }} size="small">
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
            <Recipes posts={MOST_FAVORITE_POSTS} />
            <Pagination count={10} variant="outlined" sx={{ alignSelf: 'center', mt: 6 }} />
        </Grid>
    )
}

export default RecipeList
