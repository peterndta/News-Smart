import React from 'react'

import NumberItemPagination from '../../../../../components/NumberItemPagination'

import { MOST_FAVORITE_POSTS } from '../../../../../Elixir'
import Paging from '../Pagination'
import SearchBox from '../Search'
import PostLists from './PostLists'

const PostList = () => {
    return (
        <React.Fragment>
            <SearchBox />
            <NumberItemPagination from={1} to={6} all={15} />
            <PostLists posts={MOST_FAVORITE_POSTS} />
            <Paging size={5} />
        </React.Fragment>
    )
}

export default PostList
