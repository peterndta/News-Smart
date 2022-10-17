import { get, post } from '../../utils/ApiCaller'

const useCategoryAction = () => {
    const getCategories = () => get({ endpoint: '/api/categories' })

    const createCategory = (value) =>
        post({ endpoint: `/api/admin/category`, body: { type: value } })

    const getPostCategory = (filters, pageNum = 1) =>
        get({ endpoint: `/api/category/post/page/${pageNum}${filters}` })

    return { getCategories, createCategory, getPostCategory }
}

export default useCategoryAction
