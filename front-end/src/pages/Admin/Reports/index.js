import React from 'react'

import { Box } from '@mui/material'

import RecipeFilterName from './RecipeFilterName'
import RecipeList from './RecipeList'
import SearchBox from './Search'

const Reports = () => {
    return (
        <React.Fragment>
            <RecipeFilterName />
            <Box mt={2}>
                <Box display="flex" justifyContent="flex-end">
                    <SearchBox />
                </Box>
                <Box mx={10} mt={4}>
                    <RecipeList />
                </Box>
            </Box>
        </React.Fragment>
    )
}

export default Reports
