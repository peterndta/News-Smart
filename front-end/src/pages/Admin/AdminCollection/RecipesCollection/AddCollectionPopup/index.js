import React from 'react'

import {
    Box,
    Button,
    Dialog,
    DialogActions,
    DialogContent,
    DialogTitle,
    InputBase,
    Slide,
    Typography,
} from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})
const AddCollectionPopup = (props) => {
    return (
        <Box>
            <Dialog
                open={props.status}
                TransitionComponent={Transition}
                keepMounted
                onClose={props.onClose}
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
                        Create Collection
                    </Typography>
                </DialogTitle>
                <DialogContent>
                    <Box
                        component="form"
                        sx={{
                            mt: 1,
                            p: 0.5,
                            display: 'flex',
                            alignItems: 'center',
                            width: 400,
                            border: `1px solid ${blueGrey[200]}`,
                            borderRadius: 0.5,
                        }}
                    >
                        <InputBase
                            sx={{ ml: 1, flex: 1 }}
                            placeholder="e.g. Spring Food"
                            inputProps={{ 'aria-label': 'create collection name' }}
                        />
                    </Box>
                </DialogContent>
                <DialogActions>
                    <Button onClick={props.onClose}>Close</Button>
                    <Button onClick={props.onClose}>Create</Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default AddCollectionPopup
