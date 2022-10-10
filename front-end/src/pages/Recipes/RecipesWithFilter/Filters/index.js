import React, { useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

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

import continentAtom from '../../../../recoil/continents'
import usesAtom from '../../../../recoil/uses'
import ContinentsFilter from './Continents'
import UsesFilter from './UsesFilter'

const Filter = () => {
    const continentsList = useRecoilValue(continentAtom)
    const usesList = useRecoilValue(usesAtom)
    const { search: query, pathname } = useLocation()
    const { search, continent, use, time, status } = queryString.parse(query)
    const history = useHistory('')
    const [continents, setContinents] = React.useState(continent ? continent : [])
    const [uses, setUses] = React.useState(use ? use : [])
    const [searchValue, setSearchValue] = useState(search ? search : '')

    const selectHandler = (value, type) => () => {
        if (continentsList.type === type) {
            const currentIndex = continents.indexOf(value)
            const newContinents = [...continents]
            if (currentIndex === -1) {
                newContinents.push(value)
            } else {
                newContinents.splice(currentIndex, 1)
            }
            setContinents(newContinents)
        } else if (usesList.type === type) {
            const currentIndex = uses.indexOf(value)
            const newUses = [...uses]
            if (currentIndex === -1) {
                newUses.push(value)
            } else {
                newUses.splice(currentIndex, 1)
            }
            setUses(newUses)
        }
    }

    const searchChangeHandler = (event) => {
        const searchText = event.target.value.trim()
        setSearchValue(searchText)
    }

    const clearAllHandler = () => {
        setSearchValue('')
        setContinents([])
        setUses([])
    }

    const searchSubmitHandler = () => {
        let route = pathname + '?'
        if (searchValue) route += '&search=' + searchValue

        if (continents.length !== 0)
            continents.forEach((continent) => (route += `&continent=${continent}`))

        if (uses.length !== 0) uses.forEach((use) => (route += `&use=${use}`))

        if (time) route += `&time=${time}`

        if (status) route += `&status=${status}`

        history.push(route)
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
                    <Button variant="outlined" onClick={clearAllHandler}>
                        Clear all
                    </Button>
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
                        <OutlinedInput
                            id="component-outlined"
                            label="Keyword"
                            value={searchValue}
                            onChange={searchChangeHandler}
                        />
                    </FormControl>
                </Box>
                <Divider
                    sx={{
                        backgroundColor: (theme) => theme.palette.primary.main,
                        height: 2,
                        mt: 2,
                    }}
                />
                <ContinentsFilter
                    continents={continentsList}
                    checks={continents}
                    selectHandler={selectHandler}
                />
                <Divider
                    sx={{
                        backgroundColor: (theme) => theme.palette.primary.main,
                        height: 2,
                        mt: 2,
                    }}
                />
                <UsesFilter uses={usesList} checks={uses} selectHandler={selectHandler} />
                <Box width="100%" display="flex" justifyContent="center" mt={3}>
                    <Button
                        variant="contained"
                        sx={{ color: grey[100] }}
                        onClick={searchSubmitHandler}
                    >
                        SHOW RESULTS
                    </Button>
                </Box>
            </Box>
        </Grid>
    )
}

export default Filter
