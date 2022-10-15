import React from 'react'

import { Redirect, Route } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import authAtom from '../recoil/auth'

const HybridRoute = (props) => {
    const { component, ...rest } = props
    const auth = useRecoilValue(authAtom)

    if (auth && auth.email && auth.role === 'admin') {
        return <Redirect to="/admin/users" />
    }

    return <Route component={component} {...rest} />
}

export default HybridRoute
