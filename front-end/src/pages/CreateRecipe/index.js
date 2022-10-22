import React from 'react'

import { ref, uploadBytesResumable, getDownloadURL } from 'firebase/storage'
import { Link } from 'react-router-dom'
import { useHistory } from 'react-router-dom'
import { useRecoilValue } from 'recoil'
import { v4 } from 'uuid'

import { Box, Typography, Breadcrumbs } from '@mui/material'

import { useSnackbar } from '../../HOCs/SnackbarContext'
import authAtom from '../../recoil/auth'
import useRecipe from '../../recoil/recipe/action'
import { storage } from '../../utils/Firebase'
import CreateRecipeForm from './CreareRecipeForm'

const CreateRecipe = () => {
    const showSnackbar = useSnackbar()
    const auth = useRecoilValue(authAtom)
    const recipeAction = useRecipe()
    const history = useHistory()
    const createRecipeHandler = (poster, recipe) => {
        if (poster.file) {
            let fileType = 'png'
            if (poster.file.type.endsWith('jpg')) fileType = 'jpg'
            else if (poster.file.type.endsWith('jpeg')) fileType = 'jpeg'
            const storageRef = ref(storage, `images/${poster.file.name + v4()}.${fileType}`)
            const uploadTask = uploadBytesResumable(storageRef, poster.file)
            uploadTask.on(
                'state_changed',
                () => {},
                () => {
                    showSnackbar({
                        severity: 'error',
                        children: 'Something went wrong, cannot upload event poster.',
                    })
                },
                () => {
                    getDownloadURL(uploadTask.snapshot.ref)
                        .then((url) => {
                            recipe.imageUrl = url
                            recipeAction
                                .createRecipe(+auth.userId, recipe)
                                .then(() => {
                                    showSnackbar({
                                        severity: 'success',
                                        children: 'Create recipe successfully',
                                    })
                                    history.push('/recipes/me')
                                })
                                .catch(() => {
                                    showSnackbar({
                                        severity: 'error',
                                        children:
                                            'Something went wrong, cannot upload recipe image.',
                                    })
                                })
                        })
                        .catch(() => {
                            showSnackbar({
                                severity: 'error',
                                children: 'Something went wrong, please try again later.',
                            })
                        })
                }
            )
        }
    }
    return (
        <React.Fragment>
            <Box mt={4}>
                <Breadcrumbs separator="›" aria-label="breadcrumb">
                    <Link
                        to="/"
                        style={{ color: '#637381', textDecoration: 'none' }}
                        fontWeight={700}
                    >
                        Home
                    </Link>
                    <Link
                        to="/recipes/me"
                        style={{ color: '#637381', textDecoration: 'none' }}
                        fontWeight={700}
                    >
                        My Recipes
                    </Link>
                    <Typography color="text.primary" fontWeight={700}>
                        Add A Recipe
                    </Typography>
                </Breadcrumbs>
            </Box>
            <Box mt={4}>
                <Typography variant="h3" align="center" color="primary" fontWeight={700}>
                    Create Recipe
                </Typography>
                <CreateRecipeForm createRecipeHandler={createRecipeHandler} />
            </Box>
        </React.Fragment>
    )
}

export default CreateRecipe
