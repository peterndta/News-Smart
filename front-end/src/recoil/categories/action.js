import { get, post } from '../../utils/ApiCaller'

const useCategoryAction = () => {
    const getCategories = () => get({ endpoint: '/api/categories' })

    const createCategory = (value) =>
        post({ endpoint: `/api/admin/category`, body: { type: value } })

    return { getCategories, createCategory }
}

export default useCategoryAction
