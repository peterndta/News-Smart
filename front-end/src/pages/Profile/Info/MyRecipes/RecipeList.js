import React from 'react'

import RecipeCompo from './RecipeCompo'

const RecipeList = ({ posts }) => {
    return (
        <React.Fragment>
            {posts.map((post) => (
                <RecipeCompo key={post.id} {...post} />
            ))}
        </React.Fragment>
    )
}

export default RecipeList
