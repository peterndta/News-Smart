import { get } from '../../utils/ApiCaller'

const useMethodsAction = () => {
    const getMethods = () => get({ endpoint: '/api/CookingMethods' })

    return { getMethods }
}

export default useMethodsAction
