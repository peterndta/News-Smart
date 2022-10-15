import React from 'react'

import NumberItemPagination from '../../../../../components/NumberItemPagination'
import { Search } from '@mui/icons-material'
import { Box, IconButton, InputBase, Pagination } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import { MOST_FAVORITE_POSTS } from '../../../../../Elixir'
import PostLists from './PostLists'

const PostList = () => {
    return (
        <React.Fragment>
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
                        placeholder="Search recipe name"
                        inputProps={{ 'aria-label': 'search recipe name' }}
                    />
                </Box>
            </Box>
            <NumberItemPagination from={1} to={6} all={15} />
            <PostLists posts={MOST_FAVORITE_POSTS} />
            <Pagination count={10} variant="outlined" sx={{ alignSelf: 'center', mt: 6 }} />
        </React.Fragment>
    )
}

export default PostList
