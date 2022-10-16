import { get, post } from '../../utils/ApiCaller'

const usesAction = () => {
    const getUses = () => get({ endpoint: '/api/Uses' })

    const createUses = (value) => post({ endpoint: `/api/admin/use`, body: { usesOfFood: value } })

    return { getUses, createUses }
}

export default usesAction
