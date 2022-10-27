import React, { useEffect, useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import { Autocomplete, Box, Button, FormControl, TextField, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import collectionAtom from '../../../../../recoil/collection'

const CollectionTab = ({ options }) => {
    const collectionList = useRecoilValue(collectionAtom)
    const { search: query, pathname } = useLocation()
    const { collection, pageNum, search } = queryString.parse(query)
    const history = useHistory()
    const [searchValue, setSearchValue] = useState(collection ? collection : null)

    const searchChangeHandler = (__, value) => {
        setSearchValue(value)
    }

    const filterHandler = () => {
        let route = pathname + '?'
        if (searchValue) route += '&collection=' + searchValue

        if (search && search.trim() !== '') route += '&search=' + search

        if (pageNum) route += `&pageNum=${pageNum}`

        history.push(route)
    }

    const addToCollectionHandler = () => {}

    useEffect(() => {
        filterHandler()

        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [searchValue])

    return (
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
                        value={searchValue}
                        onChange={searchChangeHandler}
                        id="controllable-states-demo"
                        options={collectionList.list.map((option) => option.collectionName)}
                        renderInput={(params) => (
                            <TextField
                                {...params}
                                label="Collection"
                                placeholder="e.g. Summer Food"
                                sx={{
                                    '& .css-1xcbdvh-MuiInputBase-root-MuiOutlinedInput-root': {
                                        paddingBottom: '12px',
                                    },
                                }}
                            />
                        )}
                        placeholder="Summer Course"
                    />
                </FormControl>
            </Box>

            <Box width="100%" display="flex" justifyContent="center" mt={3}>
                <Button
                    variant="contained"
                    sx={{ color: grey[100] }}
                    disabled={!collection}
                    onClick={addToCollectionHandler}
                >
                    ADD TO COLLECTION
                </Button>
            </Box>
        </Box>
    )
}

export default CollectionTab
