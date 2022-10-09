import { get } from '../../utils/ApiCaller'

const usesAction = () => {
    const getUses = () => get({ endpoint: '/api/Uses' })

    return { getUses }
}

export default usesAction
