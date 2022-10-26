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
    console.log(props)
    const confirmHandler = () => {
        if (props.isApprove == true) {
            props.onClose()
        } else if (props.isDeny == true) {
            props.reportHandler(props.reportId)
            props.onClose()
        }
    }
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
                <DialogContent dividers={true}>
                    <DialogContentText id="alert-dialog-slide-description">
                        Are you sure you want to continue?
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={props.onClose}>Cancel</Button>
                    <Button onClick={confirmHandler}>Confirm</Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default ConfirmPopup
