import React from 'react'

import RecipeCompo from './RecipeCompo'

const Recipes = ({ posts }) => {
    return (
        <React.Fragment>
            {posts.map((post, index) => (
                <RecipeCompo key={post.id} {...post} index={index} />
            ))}
        </React.Fragment>
    )
}

export default Recipes
