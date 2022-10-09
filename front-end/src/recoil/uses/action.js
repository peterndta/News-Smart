import { get } from '../../utils/ApiCaller'

const usesAction = () => {
    const getUses = () => get({ endpoint: '/api/uses' })

    return { getUses }
}

export default usesAction
