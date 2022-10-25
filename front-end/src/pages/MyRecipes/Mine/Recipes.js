import React from 'react'

import RecipeCompo from './RecipeCompo'

const Recipes = ({ posts, deleteRecipeHandler }) => {
    return (
        <React.Fragment>
            {posts.map((post) => (
                <RecipeCompo key={post.id} {...post} deleteRecipeHandler={deleteRecipeHandler} />
            ))}
        </React.Fragment>
    )
}

export default Recipes
