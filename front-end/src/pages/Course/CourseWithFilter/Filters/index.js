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
import { blueGrey, grey } from '@mui/material/colors'

import { COURSE_LIST } from '../../../../Elixir'
import CoursesFilter from './CoursesFilter'

const Filter = () => {
    const [courses, setCourses] = React.useState([])

    const selectHandler = (value, type) => () => {
        if (type === COURSE_LIST.type) {
            const currentIndex = courses.indexOf(value)
            const newCourses = [...courses]
            if (value === COURSE_LIST.list[0]) {
                if (currentIndex === -1) {
                    COURSE_LIST.list.forEach((course) => newCourses.push(course))
                } else {
                    COURSE_LIST.list.forEach((course) => newCourses.pop(course))
                }
            } else {
                if (currentIndex === -1) {
                    newCourses.push(value)
                } else {
                    newCourses.splice(currentIndex, 1)
                }
            }

            setCourses(newCourses)
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

                <CoursesFilter
                    methods={COURSE_LIST}
                    checks={courses}
                    selectHandler={selectHandler}
                />
                <Box width="100%" display="flex" justifyContent="center" mt={3}>
                    <Button variant="contained" sx={{ color: grey[100] }}>
                        SHOW RESULTS
                    </Button>
                </Box>
            </Box>
        </Grid>
    )
}

export default Filter
