import React from 'react'

import { ref, uploadBytesResumable, getDownloadURL } from 'firebase/storage'
import { v4 } from 'uuid'

import { Box, Typography } from '@mui/material'

import { useSnackbar } from '../../HOCs/SnackbarContext'
import { storage } from '../../utils/Firebase'
import CreateRecipeForm from './CreareRecipeForm'

const CreateRecipe = () => {
    const showSnackbar = useSnackbar()

    const createRecipeHandler = (poster) => {
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
                        .then(() => {})
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
        <Box mt={8}>
            <Typography variant="h3" align="center" color="primary" fontWeight={700}>
                Create Recipe
            </Typography>
            <CreateRecipeForm createRecipeHandler={createRecipeHandler} />
        </Box>
    )
}

export default CreateRecipe
