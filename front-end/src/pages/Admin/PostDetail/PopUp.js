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

import collectionAtom from '../../../recoil/collection'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})

const PopUp = ({ open, onClose }) => {
    const collections = useRecoilValue(collectionAtom)
    const [searchValue, setSearchValue] = useState(null)

    const searchChangeHandler = (__, value) => {
        setSearchValue(value)
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
                        size="small"
                        value={searchValue}
                        onChange={searchChangeHandler}
                        id="controllable-states-demo"
                        sx={{ ml: 3, width: '1' }}
                        options={collections.list.map((option) => option.collectionName)}
                        renderInput={(params) => (
                            <TextField
                                {...params}
                                label="Collection"
                                placeholder="e.g. Summer Food"
                                sx={{
                                    '& .css-1xcbdvh-MuiInputBase-root-MuiOutlinedInput-root': {
                                        paddingBottom: '12px',
                                    },
                                }}
                            />
                        )}
                        placeholder="Summer Course"
                    />
                </Box>
            </DialogContent>
            <DialogActions sx={{ p: 2 }}>
                <Button variant="contained" color="error" onClick={onClose}>
                    Cancel
                </Button>
                <Button variant="contained" sx={{ color: grey[100] }}>
                    Update
                </Button>
            </DialogActions>
        </Dialog>
    )
}

export default PopUp
