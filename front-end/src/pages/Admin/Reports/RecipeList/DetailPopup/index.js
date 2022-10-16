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
    Typography,
} from '@mui/material'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})
const DetailPopup = (props) => {
    return (
        <Box>
            <Dialog
                open={props.status}
                TransitionComponent={Transition}
                keepMounted
                onClose={props.onClose}
                aria-describedby="alert-dialog-slide-description"
                scroll="paper"
            >
                <DialogTitle>
                    <Typography
                        variant="h5"
                        sx={{
                            fontWeight: 700,
                        }}
                        // color="primary"
                    >
                        Report Reason
                    </Typography>
                </DialogTitle>
                <DialogContent dividers={true}>
                    <DialogContentText id="alert-dialog-slide-description">
                        Let Google help apps determine location. This means sending anonymous
                        location data to Google, even when no apps are running. Let Google help apps
                        determine location. This means sending anonymous location data to Google,
                        even when no apps are running. Let Google help apps determine location. This
                        means sending anonymous location data to Google, even when no apps are
                        running.Let Google help apps determine location. This means sending
                        anonymous location data to Google, even when no apps are running.Let Google
                        help apps determine location. This means sending anonymous location data to
                        Google, even when no apps are running. Let Google help apps determine
                        location. This means sending anonymous location data to Google, even when no
                        apps are running. Let Google help apps determine location. This means
                        sending anonymous location data to Google, even when no apps are running.
                        Let Google help apps determine location. This means sending anonymous
                        location data to Google, even when no apps are running. Let Google help apps
                        determine location. This means sending anonymous location data to Google,
                        even when no apps are running. Let Google help apps determine location. This
                        means sending anonymous location data to Google, even when no apps are
                        running. Let Google help apps determine location. This means sending
                        anonymous location data to Google, even when no apps are running. Let Google
                        help apps determine location. This means sending anonymous location data to
                        Google, even when no apps are running. Let Google help apps determine
                        location. This means sending anonymous location data to Google, even when no
                        apps are running. Let Google help apps determine location. This means
                        sending anonymous location data to Google, even when no apps are running.
                        Let Google help apps determine location. This means sending anonymous
                        location data to Google, even when no apps are running. Let Google help apps
                        determine location. This means sending anonymous location data to Google,
                        even when no apps are running.Let Google help apps determine location. This
                        means sending anonymous location data to Google, even when no apps are
                        running. Let Google help apps determine location. This means sending
                        anonymous location data to Google, even when no apps are running. Let Google
                        help apps determine location. This means sending anonymous location data to
                        Google, even when no apps are running.
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={props.onClose}>Close</Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default DetailPopup
