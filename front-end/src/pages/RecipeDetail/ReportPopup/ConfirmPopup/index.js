import React from 'react'

import {
    Box,
    Button,
    Dialog,
    DialogActions,
    DialogContent,
    DialogContentText,
    DialogTitle,
    Divider,
    Slide,
} from '@mui/material'

import { useSnackbar } from '../../../../HOCs/SnackbarContext'
import { useReport } from '../../../../recoil/report'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})
const ConfirmPopup = (props) => {
    const reportAction = useReport()
    const showSnackbar = useSnackbar()
    const reportHandler = () => {
        reportAction
            .createReport(props.userId, props.postId, props.reason.value)
            .then(() => {
                showSnackbar({
                    severity: 'success',
                    children: 'Report successfully.',
                })
                props.setIsReport(true)
                props.onClose()
                props.closeReport()
            })
            .catch((error) => {
                const message = error.response.data.message
                showSnackbar({
                    severity: 'error',
                    children:
                        message ||
                        'Something went wrong, please try again later or reload the page.',
                })
                props.onClose()
            })
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
                <DialogTitle id="alert-dialog-title">Confirm</DialogTitle>
                <DialogContent>
                    <DialogContentText id="alert-dialog-slide-description">
                        Are you sure you want to continue?
                    </DialogContentText>
                </DialogContent>
                <Divider />
                <DialogActions sx={{ my: 0.5 }}>
                    <Button onClick={props.onClose} variant="contained" color="error">
                        Cancel
                    </Button>
                    <Button
                        onClick={reportHandler}
                        variant="contained"
                        color="primary"
                        sx={{ color: 'white' }}
                    >
                        Confirm
                    </Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default ConfirmPopup
