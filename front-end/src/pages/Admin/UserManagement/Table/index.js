import React, { useEffect, useRef, useState } from 'react'

import queryString from 'query-string'
import { useLocation } from 'react-router-dom'

import Label from '../../../../components/Label'
import AdminStudentMoreMenu from '../../../../components/MoreMenu'
import {
    Paper,
    Table,
    TableHead,
    TableBody,
    TableCell,
    TableContainer,
    TableRow,
} from '@mui/material'

import { useSnackbar } from '../../../../HOCs/SnackbarContext'
import useUser from '../../../../recoil/user/action'
import Loading from '../../../Loading'
import Paging from '../Pagination'

const columns = [
    { id: 'name', label: 'Name', minWidth: 60, align: 'left' },
    { id: 'email', label: 'Email', minWidth: 100, align: 'left' },
    {
        id: 'status',
        label: 'Status',
        minWidth: 100,
        align: 'left',
    },
    {
        id: 'button',
        label: '',
        minWidth: 100,
        align: 'center',
    },
]

const filterStringGenerator = ({ name, status }) => {
    let filterString = `?PageSize=${6}`

    if (name && name.trim() !== '') filterString += '&name=' + name

    if (status === undefined) filterString += `&status=${true}`
    else filterString += `&status=${status}`

    return filterString
}

export default function StickyHeadTable() {
    const { search: query } = useLocation()
    const { name, status, pageNum } = queryString.parse(query)
    const [isLoading, setIsLoading] = useState(false)
    const [rowsData, setRowsData] = useState([])
    const usersAction = useUser()
    const showSnackBar = useSnackbar()
    const rowsPerPage = 5
    const page = pageNum === undefined ? 0 : pageNum - 1
    const totalUsers = useRef(0)

    useEffect(() => {
        const params = filterStringGenerator({ name, status })
        setIsLoading(true)

        if (pageNum === undefined) {
            usersAction
                .getUsers(params)
                .then((res) => {
                    const { totalCount } = res.data.meta
                    const datas = res.data.data
                    setRowsData(datas)
                    totalUsers.current = totalCount

                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
                .catch(() => {
                    showSnackBar({
                        severity: 'error',
                        children: 'Something went wrong, please try again later.',
                    })

                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
        } else {
            usersAction
                .getUsers(params, pageNum)
                .then((res) => {
                    const { totalCount } = res.data.meta
                    const datas = res.data.data
                    const fullData = [...rowsData, ...datas]
                    setRowsData(fullData)
                    totalUsers.current = totalCount

                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
                .catch(() => {
                    showSnackBar({
                        severity: 'error',
                        children: 'Something went wrong, please try again later.',
                    })
                    setTimeout(() => {
                        setIsLoading(false)
                    }, 500)
                })
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [name, status, pageNum])

    return (
        <React.Fragment>
            {isLoading ? (
                <Loading />
            ) : (
                <Paper sx={{ width: '100%', overflow: 'hidden' }}>
                    <TableContainer sx={{ maxHeight: 440 }}>
                        <Table stickyHeader aria-label="sticky table">
                            <TableHead>
                                <TableRow>
                                    {columns.map((column) => (
                                        <TableCell
                                            key={column.id}
                                            align={column.align}
                                            style={{ minWidth: column.minWidth }}
                                        >
                                            {column.label}
                                        </TableCell>
                                    ))}
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {rowsData
                                    .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
                                    .map((row, index) => {
                                        return (
                                            <TableRow hover tabIndex={-1} key={index}>
                                                <TableCell align="left">{row.name}</TableCell>
                                                <TableCell align="left">{row.email}</TableCell>
                                                <TableCell align="left">
                                                    {' '}
                                                    <Label
                                                        variant="ghost"
                                                        color={
                                                            row.banTime !== null
                                                                ? 'error'
                                                                : 'success'
                                                        }
                                                    >
                                                        {' '}
                                                        {row.banTime !== null ? 'Ban' : 'Active'}
                                                    </Label>
                                                </TableCell>
                                                <TableCell align="right" style={{ width: '5%' }}>
                                                    <AdminStudentMoreMenu />
                                                </TableCell>
                                            </TableRow>
                                        )
                                    })}
                            </TableBody>
                        </Table>
                    </TableContainer>
                    <Paging lengthRow={totalUsers.current} />
                </Paper>
            )}
        </React.Fragment>
    )
}
