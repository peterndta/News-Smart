import React, { useEffect, useState } from 'react'

import { useRecoilValue } from 'recoil'

import {
    Box,
    Button,
    Dialog,
    DialogActions,
    DialogContent,
    DialogTitle,
    FormControl,
    InputLabel,
    MenuItem,
    Select,
    Slide,
    Typography,
} from '@mui/material'

import { useSnackbar } from '../../HOCs/SnackbarContext'
import categoryAtom, { useCategoryAction } from '../../recoil/categories'
import { useMethodsAction } from '../../recoil/methods'
import methodsAtom from '../../recoil/methods/atom'
import usesAtom, { usesAction } from '../../recoil/uses'
import InputName from './InputName'
import ListAlreadyHad from './ListAlreadyHad'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})

const CreateType = ({ status, onClose }) => {
    const [type, setType] = React.useState('Method')
    const methodList = useRecoilValue(methodsAtom)
    const usesList = useRecoilValue(usesAtom)
    const categoryList = useRecoilValue(categoryAtom)
    const methodAction = useMethodsAction()
    const useAction = usesAction()
    const categoryAction = useCategoryAction()
    const [list, setList] = useState(methodList.list)
    const showSnackBar = useSnackbar()

    const handleChange = (event) => {
        setType(event.target.value)
    }

    useEffect(() => {
        if (type === 'Category') setList(categoryList.list)
        else if (type === 'Method') setList(methodList.list)
        else if (type === 'Use') setList(usesList.list)
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [type])

    const submitHandler = (event, value) => {
        if (value.trim().length === 0 || event.key !== 'Enter') return
        if (type === 'Category')
            categoryAction
                .createCategory(value)
                .then(() => {
                    showSnackBar({
                        severity: 'success',
                        children: 'Create category successfully.',
                    })
                    onClose()
                })
                .catch(() => {
                    if (error.response.status === 400) {
                        const message = error.response.data.message
                        showSnackBar({
                            severity: 'error',
                            children: message,
                        })
                    } else {
                        showSnackBar({
                            severity: 'error',
                            children: 'Something went wrong, please try again later.',
                        })
                    }
                })
        else if (type === 'Method')
            methodAction
                .createMethod(value)
                .then(() => {
                    showSnackBar({
                        severity: 'success',
                        children: 'Create Method successfully.',
                    })
                    onClose()
                })
                .catch((error) => {
                    if (error.response.status === 400) {
                        const message = error.response.data.message
                        showSnackBar({
                            severity: 'error',
                            children: message,
                        })
                    } else {
                        showSnackBar({
                            severity: 'error',
                            children: 'Something went wrong, please try again later.',
                        })
                    }
                })
        else if (type === 'Use')
            useAction
                .createUses(value)
                .then(() => {
                    showSnackBar({
                        severity: 'success',
                        children: 'Create Method successfully.',
                    })
                    onClose()
                })
                .catch(() => {
                    if (error.response.status === 400) {
                        const message = error.response.data.message
                        showSnackBar({
                            severity: 'error',
                            children: message,
                        })
                    } else {
                        showSnackBar({
                            severity: 'error',
                            children: 'Something went wrong, please try again later.',
                        })
                    }
                })
    }

    return (
        <Box>
            <Dialog
                open={status}
                TransitionComponent={Transition}
                keepMounted
                onClose={onClose}
                aria-describedby="alert-dialog-slide-description"
            >
                <DialogTitle>
                    <Typography
                        variant="h5"
                        sx={{
                            fontWeight: 700,
                        }}
                        color="primary"
                    >
                        Create Type
                    </Typography>
                </DialogTitle>
                <DialogContent dividers sx={{ borderBottom: 0 }}>
                    <FormControl sx={{ mt: 1, mb: 1.5 }} size="small">
                        <InputLabel id="demo-simple-select-label">Type</InputLabel>
                        <Select
                            labelId="demo-simple-select-label"
                            id="demo-simple-select"
                            value={type}
                            label="Type"
                            onChange={handleChange}
                        >
                            {/* <MenuItem value={'Collection'}>Collection</MenuItem> */}
                            <MenuItem value={'Category'}>Category</MenuItem>
                            <MenuItem value={'Method'}>Method</MenuItem>
                            <MenuItem value={'Use'}>Use</MenuItem>
                        </Select>
                    </FormControl>
                    <ListAlreadyHad options={list} type={type} />
                    <InputName type={type} submitHandler={submitHandler} />
                </DialogContent>
                <DialogActions sx={{ mb: 1.5, px: 3 }}>
                    <Button onClick={onClose} variant="outlined" color="error">
                        Close
                    </Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default CreateType
