import React from 'react'

import { Box, Pagination } from '@mui/material'

const Paging = () => {
    return (
        <Box display="flex" justifyContent="center" mt={4}>
            <Pagination count={10} variant="outlined" sx={{ alignSelf: 'center', mt: 6 }} />
        </Box>
    )
}

export default Paging
