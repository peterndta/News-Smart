import { get } from '../../utils/ApiCaller'

const useContinentsAction = () => {
    const getContinents = () => get({ endpoint: '/api/RecipeRegions' })

    return { getContinents }
}

export default useContinentsAction
