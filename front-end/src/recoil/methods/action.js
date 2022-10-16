import { get, post } from '../../utils/ApiCaller'

const useMethodsAction = () => {
    const getMethods = () => get({ endpoint: '/api/cookingmethod' })

    const createMethod = (value) =>
        post({ endpoint: `/api/admin/cookingmethod`, body: { method: value } })

    const getPostMethod = (filters, pageNum = 1) =>
        get({ endpoint: `/api/method/post/page/${pageNum}${filters}` })

    return { getMethods, createMethod, getPostMethod }
}

export default useMethodsAction
