import { get } from '../../utils/ApiCaller'

const useCategoryAction = () => {
    const getCategories = () => get({ endpoint: '/api/categories' })

    return { getCategories }
}

export default useCategoryAction
