import React from 'react'

import { Box, Divider } from '@mui/material'

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
                <Box mx={8} mt={2}>
                    <Divider
                        sx={{
                            backgroundColor: (theme) => theme.palette.primary.main,
                            height: 1.5,
                            mb: 2,
                            mt: 3,
                        }}
                    />
                </Box>
                <Box mx={10} mt={2}>
                    <RecipeList />
                </Box>
            </Box>
        </React.Fragment>
    )
}

export default Reports
