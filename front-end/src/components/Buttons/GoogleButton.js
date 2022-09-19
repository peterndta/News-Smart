import { Google as GoogleIcon } from '@mui/icons-material'
import { Button } from '@mui/material'

const GoogleButton = ({ onClick }) => {
    return (
        <Button
            type="submit"
            fullWidth
            variant="contained"
            sx={{ mt: 3, mb: 2, px: 10, py: 1, color: '#fefefe' }}
            onClick={onClick}
        >
            <GoogleIcon sx={{ mx: 1 }} />
            Sign In with Google
        </Button>
    )
}

export default GoogleButton
