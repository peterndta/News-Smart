import React, { useState } from 'react'

import { Box, Grid } from '@mui/material'

import CollectionTab from './CollectionTab'
import PostList from './PostList'
import RecipeFilterName from './RecipeFilterName'
import SearchBox from './Search'

const RecipesCollection = () => {
    const [selectionOptions, setSelectOptions] = useState([])

    const selectHandler = (id) => {
        const newCollections = [...selectionOptions]
        const currentIndex = selectionOptions.indexOf(id)
        if (currentIndex === -1) {
            newCollections.push(id)
        } else {
            newCollections.splice(currentIndex, 1)
        }
        setSelectOptions(newCollections)
    }
    return (
        <React.Fragment>
            <RecipeFilterName />
            <Box mt={8}>
                <Grid container columnSpacing={4}>
                    <Grid item md={3}>
                        <CollectionTab options={selectionOptions} />
                    </Grid>
                    <Grid item md={9} display="flex" flexDirection="column">
                        <SearchBox />
                        <PostList selectHandler={selectHandler} options={selectionOptions} />
                    </Grid>
                </Grid>
            </Box>
        </React.Fragment>
    )
}

export default RecipesCollection
