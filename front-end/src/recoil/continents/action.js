import { get } from '../../utils/ApiCaller'

const useContinentsAction = () => {
    const getContinents = () => get({ endpoint: '/api/reciperegions' })

    return { getContinents }
}

export default useContinentsAction
