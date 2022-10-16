import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import { Autocomplete, Box, FormControl, Grid, TextField, Typography } from '@mui/material'
import { blueGrey } from '@mui/material/colors'

import collectionAtom from '../../../../recoil/collection'

const Filter = () => {
    const collectionList = useRecoilValue(collectionAtom)
    const { search: query, pathname } = useLocation()
    const { collection, sort, pageNum } = queryString.parse(query)
    const history = useHistory('')
    const [searchValue, setSearchValue] = useState(collection ? collection : null)

    const searchChangeHandler = (__, value) => {
        setSearchValue(value)
    }

    const filterHandler = () => {
        let route = pathname + '?'
        if (searchValue) route += '&collection=' + searchValue

        if (sort) route += `&sort=${sort}`

        if (pageNum) route += `&pageNum=${pageNum}`

        history.push(route)
    }

    useEffect(() => {
        filterHandler()

        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [searchValue])

    useEffect(() => {
        if (collectionList.list) setSearchValue(collectionList.list[0].collectionName)
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [JSON.stringify(collectionList)])

    return (
        <Grid item md={3}>
            <Box p={3} sx={{ border: `1px solid ${blueGrey[200]}`, borderRadius: 1 }}>
                <Box
                    display="flex"
                    justifyContent="space-between"
                    alignItems="center"
                    pb={1}
                    mb={2}
                    sx={{ borderBottom: (theme) => `3px solid ${theme.palette.primary.main}` }}
                >
                    <Typography variant="h4" fontWeight={700} sx={{ color: blueGrey[800] }}>
                        Select
                    </Typography>
                </Box>
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
                        my: 1.5,
                    }}
                >
                    <Autocomplete
                        value={searchValue}
                        id="controllable-states-demo"
                        onChange={searchChangeHandler}
                        options={collectionList.list.map((option) => option.collectionName)}
                        renderInput={(params) => <TextField {...params} label="Collection" />}
                        disableClearable={searchValue !== null}
                        sx={{ height: '1.1 em' }}
                    />
                </FormControl>
            </Box>
        </Grid>
    )
}

export default Filter
