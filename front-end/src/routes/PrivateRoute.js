import { Redirect, Route } from 'react-router-dom'
import { useRecoilValue } from 'recoil'

import authAtom from '../recoil/auth'

const PrivateRoute = (props) => {
    const { role, ...rest } = props
    const auth = useRecoilValue(authAtom)
    if (!auth.email) {
        return <Redirect to="/" />
    }

    if (role == 'admin') {
        if (auth.role !== 'admin') {
            return <Redirect to="/" />
        }
    } else if (role == 'user') {
        if (auth.role === 'admin') {
            return <Redirect to="/admin/posts-management" />
        }
    }

    return <Route {...rest} />
}

export default PrivateRoute
