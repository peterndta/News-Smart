import React from 'react'

import {
    Box,
    Button,
    Dialog,
    DialogActions,
    DialogContent,
    DialogTitle,
    FormControl,
    InputBase,
    InputLabel,
    MenuItem,
    Select,
    Slide,
    Typography,
} from '@mui/material'
import { blueGrey } from '@mui/material/colors'

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />
})

const CreateType = ({ status, onClose }) => {
    const [type, setType] = React.useState('Collection')

    const handleChange = (event) => {
        setType(event.target.value)
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
                    <FormControl fullWidth sx={{ mt: 1, mb: 1.5 }} size="small">
                        <InputLabel id="demo-simple-select-label">Type</InputLabel>
                        <Select
                            labelId="demo-simple-select-label"
                            id="demo-simple-select"
                            value={type}
                            label="Type"
                            onChange={handleChange}
                        >
                            <MenuItem value={'Collection'}>Collection</MenuItem>
                            <MenuItem value={'Category'}>Category</MenuItem>
                            <MenuItem value={'Method'}>Method</MenuItem>
                            <MenuItem value={'Use'}>Use</MenuItem>
                        </Select>
                    </FormControl>
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
                <DialogActions sx={{ mb: 1.5 }}>
                    <Button onClick={onClose} variant="outlined" color="error">
                        Close
                    </Button>
                    <Button onClick={onClose} variant="outlined" sx={{ ml: 1.5 }}>
                        Create
                    </Button>
                </DialogActions>
            </Dialog>
        </Box>
    )
}

export default CreateType
