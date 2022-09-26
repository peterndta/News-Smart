import React from 'react'

import BookmarkCompo from './BookmarkCompo'

const Bookmarks = ({ posts }) => {
    return (
        <React.Fragment>
            {posts.map((post) => (
                <BookmarkCompo key={post.id} {...post} />
            ))}
        </React.Fragment>
    )
}

export default Bookmarks
