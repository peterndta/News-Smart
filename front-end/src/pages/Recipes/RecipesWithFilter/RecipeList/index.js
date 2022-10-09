import React, { useState } from 'react'

// import queryString from 'query-string'
// import { useLocation } from 'react-router-dom'
import { FormControl, Grid, InputLabel, MenuItem, Pagination, Select } from '@mui/material'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import Recipes from './RecipesCompo'

const RecipeList = () => {
    const [type, setType] = React.useState('')
    const [posts, setPosts] = useState(MOST_FAVORITE_POSTS)

    const handleChange = (event) => {
        setType(event.target.value)
    }

    // const searchHandler = () => {
    //     const newPosts = [...posts]
    //     const filterNewPosts = newPosts.filter((post) => post.name.includes(q))
    //     setPosts(filterNewPosts)
    // }

    // useEffect(() => {
    //     searchHandler()
    //     // eslint-disable-next-line react-hooks/exhaustive-deps
    // }, [q])
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
                    <MenuItem value={1}>Popularity</MenuItem>
                    <MenuItem value={2}>Newest</MenuItem>
                    <MenuItem value={3}>Oldest</MenuItem>
                </Select>
            </FormControl>
            <Recipes posts={posts} />
            <Pagination count={10} variant="outlined" sx={{ alignSelf: 'center', mt: 6 }} />
        </Grid>
    )
}

export default RecipeList
