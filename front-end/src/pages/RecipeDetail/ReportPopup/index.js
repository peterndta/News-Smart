import React, { useState } from 'react'

import {
    Box,
    Button,
    Dialog,
    DialogActions,
    DialogContent,
    DialogContentText,
    DialogTitle,
    Slide,
    TextField,
    Typography,
} from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import ConfirmPopup from '../ConfirmPopup'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})
const isEmpty = (incomeValue) => incomeValue.trim().length === 0
const defaultTextFieldValue = { value: '', isTouched: false }
const DetailPopup = (props) => {
    const [openConfirm, setOpenConfirm] = React.useState(false)
    const [description, setDescription] = useState(defaultTextFieldValue)
    const descriptionChangeHandler = (event) => {
        setDescription((previousValue) => ({ ...previousValue, value: event.target.value }))
    }
    const descriptionTouchedHandler = () => {
        setDescription((previousValue) => ({ ...previousValue, isTouched: true }))
    }
    const handleOpenConfirm = () => {
        setOpenConfirm(true)
    }
    const descriptionIsInValid = isEmpty(description.value) && description.isTouched
    return (
        <Box>
            {openConfirm && (
                <ConfirmPopup
                    status={openConfirm}
                    onClose={function () {
                        setOpenConfirm(false)
                    }}
                />
            )}
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
                        Report
                    </Typography>
                </DialogTitle>
                <DialogContent dividers={true}>
                    <TextField
                        autoFocus
                        margin="dense"
                        id="name"
                        label="Your report reason"
                        fullWidth
                        variant="standard"
                        multiline
                        onChange={descriptionChangeHandler}
                        onBlur={descriptionTouchedHandler}
                        error={descriptionIsInValid}
                        minrows={4}
                    />
                    <DialogContentText mt={4} id="alert-dialog-slide-description">
                        <Typography
                            variant="subtitle1"
                            sx={{ fontSize: 13, color: blueGrey[400] }}
                            fontWeight={400}
                        >
                            For flagged posts, the Admin team will review flagged posts to determine
                            if they have a problem. Problematic posts will be removed, and severe or
                            repeated infractions may result in account termination.
                        </Typography>
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={props.onClose}>Close</Button>
                    <Button onClick={handleOpenConfirm}>Send</Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default DetailPopup
