import React, { useState } from 'react'

import { useRecoilValue } from 'recoil'

import {
    Autocomplete,
    Box,
    Button,
    Dialog,
    DialogActions,
    DialogContent,
    DialogTitle,
    Slide,
    TextField,
    Typography,
} from '@mui/material'
import { grey } from '@mui/material/colors'

import { useSnackbar } from '../../../HOCs/SnackbarContext'
import collectionAtom, { useCollection } from '../../../recoil/collection'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})

const PopUp = ({ open, onClose, collection, postId, setCollections }) => {
    const collections = useRecoilValue(collectionAtom)
    const [searchValue, setSearchValue] = useState(collection)
    const collectionAction = useCollection()
    const showSnackbar = useSnackbar()

    const searchChangeHandler = (__, value) => {
        setSearchValue(value)
    }

    const updateToCollectionHandler = () => {
        let collectionsId = []
        collections.list.forEach((collect) => {
            if (searchValue.includes(collect.collectionName)) {
                collectionsId.push(collect.id)
            }
        })

        collectionAction
            .updatePostsToCollection(postId, { collectionsId: collectionsId })
            .then(() => {
                showSnackbar({
                    severity: 'success',
                    children: 'Update to collection successfully.',
                })
                setCollections(searchValue)
                onClose()
            })
            .catch(() => {
                showSnackbar({
                    severity: 'error',
                    children: 'Something went wrong, please refresh page then try again!',
                })
            })
    }

    return (
        <Dialog
            open={open}
            onClose={onClose}
            aria-describedby="alert-dialog-slide-description"
            TransitionComponent={Transition}
        >
            <DialogTitle>Update to collection</DialogTitle>
            <DialogContent dividers sx={{ minWidth: 400, p: 4 }}>
                <Box sx={{ display: 'flex', alignItems: 'flex-start' }}>
                    <Typography fontWeight={700} variant="h6">
                        Choose collection
                    </Typography>
                    <Autocomplete
                        value={searchValue}
                        size="small"
                        onChange={searchChangeHandler}
                        id="controllable-states-demo"
                        sx={{ ml: 3, width: '50%' }}
                        options={collections.list.map((option) => option.collectionName)}
                        multiple
                        limitTags={2}
                        renderInput={(params) => (
                            <TextField
                                {...params}
                                label="Collection"
                                placeholder="e.g. Summer"
                                sx={{
                                    '& .css-1xcbdvh-MuiInputBase-root-MuiOutlinedInput-root': {
                                        paddingBottom: '12px',
                                    },
                                }}
                            />
                        )}
                        placeholder="Summer Course"
                        disableClearable={!searchValue.length !== 0}
                    />
                </Box>
            </DialogContent>
            <DialogActions sx={{ p: 2 }}>
                <Button variant="contained" color="error" onClick={onClose}>
                    Cancel
                </Button>
                <Button
                    variant="contained"
                    sx={{ color: grey[100] }}
                    onClick={updateToCollectionHandler}
                >
                    Update
                </Button>
            </DialogActions>
        </Dialog>
    )
}

export default PopUp
