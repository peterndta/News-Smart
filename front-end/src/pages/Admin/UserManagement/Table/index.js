import React, { useEffect } from 'react'

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

function createData(name, email, status, button) {
    return { name, email, status, button }
}

const rows = [
    createData('Nguyen Van A', 'example@gmail.com', 0, ''),
    createData('Nguyen Van B', 'example1@gmail.com', 1, ''),
    createData('Nguyen Van C', 'example2@gmail.com', 0, ''),
    createData('Nguyen Van D', 'example3@gmail.com', 1, ''),
    createData('Nguyen Van E', 'example4@gmail.com', 0, ''),
    createData('Nguyen Van F', 'example5@gmail.com', 1, ''),
    createData('Nguyen Van G', 'example6@gmail.com', 0, ''),
    createData('Nguyen Van H', 'example7@gmail.com', 1, ''),
    createData('Nguyen Van I', 'example8@gmail.com', 0, ''),
    createData('Nguyen Van K', 'example9@gmail.com', 1, ''),
    createData('Nguyen Van L', 'example10@gmail.com', 0, ''),
    createData('Nguyen Van M', 'example11@gmail.com', 1, ''),
    createData('Nguyen Van N', 'example12@gmail.com', 1, ''),
]

const filterStringGenerator = ({ search, sort }) => {
    let filterString = `?PageSize=${6}`

    if (search && search.trim() !== '') filterString += '&search=' + search

    if (sort !== undefined) filterString += `&sort=${sort}`

    return filterString
}

export default function StickyHeadTable() {
    const { search: query } = useLocation()
    const { search, sort, pageNum } = queryString.parse(query)

    const rowsPerPage = 5
    const page = pageNum === undefined ? 0 : pageNum - 1
    useEffect(() => {
        const params = filterStringGenerator({ search, sort })
        console.log(params)
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [search, sort, pageNum])

    return (
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
                        {rows
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
                                                    (row?.status === 0 && 'error') ||
                                                    (row?.status === 1 && 'success')
                                                }
                                            >
                                                {' '}
                                                {row?.status == 0 ? 'Ban' : 'Active'}
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
            <Paging lengthRow={rows.length} />
        </Paper>
    )
}
