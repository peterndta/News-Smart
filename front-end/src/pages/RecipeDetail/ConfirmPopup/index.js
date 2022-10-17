import React from 'react'

import {
    Box,
    Button,
    Dialog,
    DialogActions,
    DialogContent,
    DialogContentText,
    DialogTitle,
    Slide,
} from '@mui/material'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})
const ConfirmPopup = (props) => {
    return (
        <Box>
            <Dialog
                open={props.status}
                TransitionComponent={Transition}
                keepMounted
                onClose={props.onClose}
                aria-describedby="alert-dialog-slide-description"
            >
                <DialogTitle id="alert-dialog-title">
                    {/* <Typography
                        // variant="h5"
                        sx={{
                            fontWeight: 700,
                        }}
                        // color="primary"
                    > */}
                    {'Confirm'}
                    {/* </Typography> */}
                </DialogTitle>
                <DialogContent>
                    <DialogContentText id="alert-dialog-slide-description">
                        Are you sure you want to continue?
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={props.onClose}>Cancel</Button>
                    <Button onClick={props.onClose}>Confirm</Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default ConfirmPopup
