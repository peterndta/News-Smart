import React from 'react'

import PostListCompo from './PostListCompo'

const PostLists = ({ posts, selectHandler, options }) => {
    return (
        <React.Fragment>
            {posts.map((post) => (
                <PostListCompo
                    key={post.id}
                    {...post}
                    selectHandler={selectHandler}
                    options={options}
                />
            ))}
        </React.Fragment>
    )
}

export default PostLists
