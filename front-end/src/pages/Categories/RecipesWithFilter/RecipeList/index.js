import React from 'react'

import { FormControl, Grid, InputLabel, MenuItem, Pagination, Select } from '@mui/material'

import { MOST_FAVORITE_POSTS } from '../../../../Elixir'
import Recipes from './RecipesCompo'

const RecipeList = () => {
    const [type, setType] = React.useState('')

    const handleChange = (event) => {
        setType(event.target.value)
    }
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
                    <MenuItem value={'popularity'}>Popularity</MenuItem>
                    <MenuItem value={'newest'}>Newest</MenuItem>
                    <MenuItem value={'oldest'}>Oldest</MenuItem>
                </Select>
            </FormControl>
            <Recipes posts={MOST_FAVORITE_POSTS} />
            <Pagination count={10} variant="outlined" sx={{ alignSelf: 'center', mt: 6 }} />
        </Grid>
    )
}

export default RecipeList
