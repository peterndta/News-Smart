import { get } from '../../utils/ApiCaller'

const useUser = () => {
    const getUsers = (params, pageNum = 1) =>
        get({ endpoint: `/api/user/page/${pageNum}${params}` })

    return { getUsers }
}

export default useUser
