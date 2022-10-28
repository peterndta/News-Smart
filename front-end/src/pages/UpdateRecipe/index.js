import React, { useEffect, useState } from 'react'

import { getDownloadURL, ref, uploadBytesResumable } from 'firebase/storage'
import { Link, useHistory, useParams } from 'react-router-dom'
import { v4 } from 'uuid'

import { Box, Breadcrumbs, Typography } from '@mui/material'

import { useSnackbar } from '../../HOCs/SnackbarContext'
import useRecipe from '../../recoil/recipe/action'
import { storage } from '../../utils/Firebase'
import Loading from '../Loading'
import CreateRecipeForm from './CreareRecipeForm'

const UpdateRecipe = () => {
    const showSnackbar = useSnackbar()
    const recipeAction = useRecipe()
    const history = useHistory()
    const { id } = useParams()
    const [recipe, setRecipe] = useState(null)
    const [step, setStep] = useState(null)
    const [isLoading, setIsLoading] = useState(false)
    useEffect(() => {
        setIsLoading(true)
        recipeAction
            .getRecipe(id)
            .then((response) => {
                const data = response.data.data
                setRecipe(data)
                console.log(data)
                setIsLoading(false)
            })
            .catch((error) => {
                const message = error.response.data.message
                showSnackbar({
                    severity: 'error',
                    children: message || 'Something went wrong, please try again later.',
                })
                setIsLoading(false)
            })
        recipeAction
            .getStep(id)
            .then((response) => {
                const steps = response.data.data
                setStep(steps)
                console.log(steps)
            })
            .catch((error) => {
                const message = error.response.data.message
                showSnackbar({
                    severity: 'error',
                    children: message || 'Something went wrong, please try again later.',
                })
            })
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [])
    const createRecipeHandler = (poster, recipe) => {
        if (poster.file == null) {
            console.log(false)
            recipe.imageUrl = poster.src
            recipeAction
                .updateRecipe(id, recipe)
                .then(() => {
                    showSnackbar({
                        severity: 'success',
                        children: 'Update recipe successfully',
                    })
                    history.push('/me')
                })
                .catch(() => {
                    showSnackbar({
                        severity: 'error',
                        children: 'Something went wrong, cannot upload recipe image.',
                    })
                })
        } else if (poster.file) {
            console.log(true)
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
                                .updateRecipe(id, recipe)
                                .then(() => {
                                    showSnackbar({
                                        severity: 'success',
                                        children: 'Update recipe successfully',
                                    })
                                    history.push('/me')
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
            {isLoading ? (
                <Loading />
            ) : (
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
                                to="/me"
                                style={{ color: '#637381', textDecoration: 'none' }}
                                fontWeight={700}
                            >
                                My Recipes
                            </Link>
                            <Link
                                to={`/recipes/${id}`}
                                style={{ color: '#637381', textDecoration: 'none' }}
                                fontWeight={700}
                            >
                                {recipe?.name}
                            </Link>
                            <Typography color="text.primary" fontWeight={700}>
                                Edit
                            </Typography>
                        </Breadcrumbs>
                    </Box>
                    <Box mt={4}>
                        <Typography variant="h3" align="center" color="primary" fontWeight={700}>
                            Update Recipe
                        </Typography>

                        {step && recipe && (
                            <CreateRecipeForm
                                recipe={recipe}
                                step={step}
                                createRecipeHandler={createRecipeHandler}
                            />
                        )}
                    </Box>
                </React.Fragment>
            )}
        </React.Fragment>
    )
}

export default UpdateRecipe
