import React, { useEffect, useRef, useState } from 'react'

import queryString from 'query-string'
import { useHistory, useLocation } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import { Box, Button, Divider, Grid, Typography } from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import continentAtom from '../../../../recoil/continents'
import usesAtom from '../../../../recoil/uses'
import ContinentsFilter from './Continents'
import UsesFilter from './UsesFilter'

const Filter = () => {
    const continentsList = useRecoilValue(continentAtom)
    const usesList = useRecoilValue(usesAtom)
    const { search: query, pathname } = useLocation()
    const { search, continent, use, sort, pageNum } = queryString.parse(query)
    const history = useHistory('')
    const [continents, setContinents] = useState(continent ? continent : [])
    const [uses, setUses] = useState(use ? use : [])
    const isClearAll = useRef(false)

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
        isClearAll.current = false
    }

    const clearAllHandler = () => {
        setContinents([])
        setUses([])
        isClearAll.current = true
    }

    const searchSubmitHandler = () => {
        let route = pathname + '?'
        if (search) route += '&search=' + search

        if (continents.length !== 0)
            continents.forEach((continent) => (route += `&continent=${continent}`))

        if (uses.length !== 0) uses.forEach((use) => (route += `&use=${use}`))

        if (sort) route += `&sort=${sort}`

        if (pageNum) route += `&pageNum=${pageNum}`

        history.push(route)
    }

    useEffect(() => {
        if (isClearAll.current === true) searchSubmitHandler()

        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [isClearAll.current === false])

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
                        Select
                    </Typography>
                    <Button variant="outlined" onClick={clearAllHandler}>
                        Clear all
                    </Button>
                </Box>
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
