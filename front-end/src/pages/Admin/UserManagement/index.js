import React from 'react'

import { Search } from '@mui/icons-material'
import {
    Box,
    FormControl,
    Grid,
    IconButton,
    InputBase,
    InputLabel,
    MenuItem,
    Select,
    Typography,
} from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import StickyHeadTable from './Table'

const UserManagement = () => {
    const [type, setType] = React.useState('')

    const handleChange = (event) => {
        setType(event.target.value)
    }
    return (
        <Box mt={4} mb={11}>
            <Grid mb={5} container columnSpacing={4}>
                <Grid mt={4} item md={6}>
                    <Typography variant="h3" fontWeight={700} sx={{ color: blueGrey[800] }}>
                        User Management
                    </Typography>
                </Grid>
                <Grid mt={4} item md={4}>
                    <Box
                        component="form"
                        sx={{
                            p: 0.5,
                            display: 'flex',
                            alignItems: 'center',
                            width: 380,
                            border: `1px solid ${blueGrey[200]}`,
                            borderRadius: 0.5,
                        }}
                    >
                        <IconButton type="button" sx={{ p: '10px' }} aria-label="search">
                            <Search />
                        </IconButton>
                        <InputBase
                            sx={{ ml: 1, flex: 1 }}
                            placeholder="Search recipe name"
                            inputProps={{ 'aria-label': 'search recipe name' }}
                        />
                    </Box>
                </Grid>
                <Grid mt={4} item md={2}>
                    <FormControl sx={{ minWidth: 100, alignSelf: 'flex-end' }} size="medium">
                        <InputLabel id="demo-select-small">Type</InputLabel>
                        <Select
                            labelId="demo-select-small"
                            id="demo-select-small"
                            value={type}
                            label="Type"
                            onChange={handleChange}
                        >
                            <MenuItem value={'name'}>Name</MenuItem>
                            <MenuItem value={'email'}>Email</MenuItem>
                            <MenuItem value={'status'}>Status</MenuItem>
                        </Select>
                    </FormControl>
                </Grid>
            </Grid>
            <StickyHeadTable />
        </Box>
    )
}

export default UserManagement
