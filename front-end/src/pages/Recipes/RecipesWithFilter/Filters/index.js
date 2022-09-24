import React from 'react'

import {
    Box,
    Button,
    Divider,
    FormControl,
    Grid,
    InputLabel,
    OutlinedInput,
    Typography,
} from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import { CATEGORY_LIST, METHOD_LIST } from '../../../../Elixir'
import CategoriesFilter from './CategoriesFilter'
import MethodsFilter from './MethodsFilter'

const Filter = () => {
    const [categories, setCategories] = React.useState([])
    const [methods, setMethods] = React.useState([])
    const selectHandler = (value, type) => () => {
        if (type === CATEGORY_LIST.type) {
            const currentIndex = categories.indexOf(value)
            const newCategories = [...categories]

            if (currentIndex === -1) {
                newCategories.push(value)
            } else {
                newCategories.splice(currentIndex, 1)
            }

            setCategories(newCategories)
        } else if (type === METHOD_LIST.type) {
            const currentIndex = methods.indexOf(value)
            const newMethods = [...methods]

            if (currentIndex === -1) {
                newMethods.push(value)
            } else {
                newMethods.splice(currentIndex, 1)
            }

            setMethods(newMethods)
        }
    }
    return (
        <Grid item md={3}>
            <Box p={3} sx={{ border: `1px solid ${blueGrey[200]}`, borderRadius: 1 }}>
                <Box
                    display="flex"
                    justifyContent="space-between"
                    alignItems="center"
                    pb={1}
                    sx={{ borderBottom: (theme) => `3px solid ${theme.palette.primary.main}` }}
                >
                    <Typography variant="h4" fontWeight={700} sx={{ color: blueGrey[800] }}>
                        Filters
                    </Typography>
                    <Button variant="outlined">Clear all</Button>
                </Box>
                <Box mt={3} mb={1}>
                    <Typography variant="h6" fontWeight={700} sx={{ color: blueGrey[800] }} mb={2}>
                        Recipe or keyword
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
                        <InputLabel htmlFor="component-outlined" sx={{ top: -5 }}>
                            Keyword
                        </InputLabel>
                        <OutlinedInput id="component-outlined" label="Keyword" />
                    </FormControl>
                </Box>
                <Divider
                    sx={{
                        backgroundColor: (theme) => theme.palette.primary.main,
                        height: 2,
                        mt: 2,
                    }}
                />
                <CategoriesFilter
                    categories={CATEGORY_LIST}
                    checks={categories}
                    selectHandler={selectHandler}
                />
                <Divider
                    sx={{ backgroundColor: (theme) => theme.palette.primary.main, height: 2 }}
                />
                <MethodsFilter
                    methods={METHOD_LIST}
                    checks={methods}
                    selectHandler={selectHandler}
                />
            </Box>
        </Grid>
    )
}

export default Filter
