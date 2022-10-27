import React from 'react'

import NumberItemPagination from '../../../../../components/NumberItemPagination'

import { MOST_FAVORITE_POSTS } from '../../../../../Elixir'
import Paging from '../Pagination'
import SearchBox from '../Search'
import PostLists from './PostLists'

const PostList = ({ selectHandler, options }) => {
    return (
        <React.Fragment>
            <SearchBox />
            <NumberItemPagination from={1} to={6} all={15} />
            <PostLists
                posts={MOST_FAVORITE_POSTS}
                selectHandler={selectHandler}
                options={options}
            />
            <Paging size={5} />
        </React.Fragment>
    )
}

export default PostList
