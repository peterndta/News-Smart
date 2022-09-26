import React from 'react'

import PostListCompo from './PostListCompo'

const PostLists = ({ posts }) => {
    return (
        <React.Fragment>
            {posts.map((post) => (
                <PostListCompo key={post.id} {...post} />
            ))}
        </React.Fragment>
    )
}

export default PostLists
