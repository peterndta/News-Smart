import React from 'react'

import { Box } from '@mui/material'

import { MOST_FAVORITE_POSTS, LATEST_POSTS } from '../../Elixir'
import meal from '../../assets/images/meal.jpg'
import Recipes from './RecipesCompo'

const Home = () => {
    return (
        <Box mt={8}>
            <Box
                component="img"
                alt="meal"
                src={meal}
                sx={{
                    width: '100%',
                    aspectRatio: '16 / 9',
                    objectFit: 'cover',
                    height: 300,
                }}
            />
            <Recipes posts={LATEST_POSTS} title="Latest Recipes" linkTo={'/recipes?sort=Newest'} />
            <Recipes
                posts={MOST_FAVORITE_POSTS}
                title="Latest Recipes"
                linkTo={'/recipes?sort=Popularity'}
            />
        </Box>
    )
}

export default Home
