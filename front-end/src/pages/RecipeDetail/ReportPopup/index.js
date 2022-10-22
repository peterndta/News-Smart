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

import ConfirmPopup from './ConfirmPopup'

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
    const handleClickCloseConfirm = () => {
        setOpenConfirm(false)
    }
    const descriptionIsInValid = isEmpty(description.value) && description.isTouched
    const overallTextFieldIsValid = !isEmpty(description.value)

    return (
        <Box>
            {openConfirm && (
                <ConfirmPopup
                    status={openConfirm}
                    onClose={handleClickCloseConfirm}
                    userId={props.userId}
                    postId={props.postId}
                    reason={description}
                    setIsReport={props.setIsReport}
                    closeReport={props.onClose}
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
                        component={'span'}
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
                        required
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
                            component={'span'}
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
                    <Button disabled={!overallTextFieldIsValid} onClick={handleOpenConfirm}>
                        Send
                    </Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default DetailPopup
