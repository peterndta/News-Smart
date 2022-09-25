import React from 'react'

import RatingCompo from './RatingCompo'

const Ratings = ({ posts }) => {
    return (
        <React.Fragment>
            {posts.map((post) => (
                <RatingCompo key={post.id} {...post} />
            ))}
        </React.Fragment>
    )
}

export default Ratings
