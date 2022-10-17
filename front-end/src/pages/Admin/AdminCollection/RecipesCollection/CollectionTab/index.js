import React from 'react'

import { Autocomplete, Box, Button, FormControl, Grid, TextField, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

const options = ['Option 1', 'Option 2']

const CollectionTab = () => {
    const [value, setValue] = React.useState(options[0])
    const [inputValue, setInputValue] = React.useState('')

    return (
        <Grid item md={3}>
            <Box p={3} sx={{ border: `1px solid ${blueGrey[200]}`, borderRadius: 1 }}>
                <Box mt={3} mb={1}>
                    <Typography
                        variant="h6"
                        fontWeight={700}
                        textAlign="center"
                        sx={{ color: blueGrey[800] }}
                        mb={2}
                    >
                        COLLECTION NAME
                    </Typography>

                    <FormControl
                        sx={{
                            width: '100%',
                            '& label.Mui-focused': {
                                color: blueGrey[800],
                            },
                            '& .css-1xnpwac-MuiInputBase-root-MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline':
                                {
                                    borderColor: blueGrey[800],
                                },
                            '& .MuiOutlinedInput-input': {
                                height: '0.8em',
                            },
                        }}
                    >
                        <Autocomplete
                            value={value}
                            onChange={(__, newValue) => {
                                setValue(newValue)
                            }}
                            inputValue={inputValue}
                            onInputChange={(__, newInputValue) => {
                                setInputValue(newInputValue)
                            }}
                            id="controllable-states-demo"
                            options={options}
                            renderInput={(params) => (
                                <TextField {...params} placeholder="e.g. Summer Food" />
                            )}
                            placeholder="Summer Course"
                        />
                    </FormControl>
                </Box>

                <Box width="100%" display="flex" justifyContent="center" mt={3}>
                    <Button variant="contained" sx={{ color: grey[100] }}>
                        ADD TO COLLECTION
                    </Button>
                </Box>
            </Box>
        </Grid>
    )
}

export default CollectionTab
