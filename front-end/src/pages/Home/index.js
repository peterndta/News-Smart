import React from 'react'

import { Box } from '@mui/material'

import meal from '../../assets/images/meal.jpg'
import Recipes from './RecipesCompo'

const latestPosts = [
    {
        id: 1,
        name: 'Chicken and Broccoli Stir-Fry',
        description:
            'Delicious, savory, and visually enticing chicken and broccoli stir-fry recipe!...',
        rating: 4,
        author: 'chefMandy',
        image: 'https://loveincorporated.blob.core.windows.net/contentimages/gallery/d9e900e4-212e-4c3d-96d5-cb14a023c659-worlds-most-delicious-dishes.jpg',
    },
    {
        id: 2,
        name: 'Chicken and Broccoli Stir-Fry',
        description:
            'Delicious, savory, and visually enticing chicken and broccoli stir-fry recipe!...',
        rating: 4,
        author: 'chefMandy',
        image: 'https://loveincorporated.blob.core.windows.net/contentimages/gallery/d9e900e4-212e-4c3d-96d5-cb14a023c659-worlds-most-delicious-dishes.jpg',
    },
    {
        id: 3,
        name: 'Chicken and Broccoli Stir-Fry',
        description:
            'Delicious, savory, and visually enticing chicken and broccoli stir-fry recipe!...',
        rating: 4,
        author: 'chefMandy',
        image: 'https://loveincorporated.blob.core.windows.net/contentimages/gallery/d9e900e4-212e-4c3d-96d5-cb14a023c659-worlds-most-delicious-dishes.jpg',
    },
]

const mostFavoritePosts = [
    {
        id: 1,
        name: 'Chicken and Broccoli Stir-Fry',
        description:
            'Delicious, savory, and visually enticing chicken and broccoli stir-fry recipe!...',
        rating: 4,
        author: 'chefMandy',
        image: 'https://loveincorporated.blob.core.windows.net/contentimages/gallery/d9e900e4-212e-4c3d-96d5-cb14a023c659-worlds-most-delicious-dishes.jpg',
    },
    {
        id: 2,
        name: 'Chicken and Broccoli Stir-Fry',
        description:
            'Delicious, savory, and visually enticing chicken and broccoli stir-fry recipe!...',
        rating: 4,
        author: 'chefMandy',
        image: 'https://loveincorporated.blob.core.windows.net/contentimages/gallery/d9e900e4-212e-4c3d-96d5-cb14a023c659-worlds-most-delicious-dishes.jpg',
    },
    {
        id: 3,
        name: 'Chicken and Broccoli Stir-Fry',
        description:
            'Delicious, savory, and visually enticing chicken and broccoli stir-fry recipe!...',
        rating: 4,
        author: 'chefMandy',
        image: 'https://loveincorporated.blob.core.windows.net/contentimages/gallery/d9e900e4-212e-4c3d-96d5-cb14a023c659-worlds-most-delicious-dishes.jpg',
    },
]

const Home = () => {
    return (
        <React.Fragment>
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
                <Recipes posts={latestPosts} title="Latest Recipes" />
                <Recipes posts={mostFavoritePosts} title="Latest Recipes" />
            </Box>
        </React.Fragment>
    )
}

export default Home
