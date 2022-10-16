import { get, post } from '../../utils/ApiCaller'

const useMethodsAction = () => {
    const getMethods = () => get({ endpoint: '/api/cookingmethod' })

    const createMethod = (value) =>
        post({ endpoint: `/api/admin/cookingmethod`, body: { method: value } })

    return { getMethods, createMethod }
}

export default useMethodsAction
