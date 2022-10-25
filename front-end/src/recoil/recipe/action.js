import { get, post, put, remove } from '../../utils/ApiCaller'

const useRecipe = () => {
    const getRecipe = (id) =>
        get({
            endpoint: `/api/post/${id}`,
        })

    const getStep = (id) =>
        get({
            endpoint: `/api/post/${id}/step`,
        })

    const createRecipe = (userId, recipe) =>
        post({
            endpoint: `/api/user/${userId}/post`,
            body: recipe,
        })
    const updateRecipe = (userId, recipe) =>
        put({
            endpoint: `/api/post/${userId}`,
            body: recipe,
        })
    const deleteRecipe = (postId) =>
        remove({
            endpoint: `/api/post/${postId}`,
        })

    const getRecipes = (filters, pageNum = 1) =>
        get({ endpoint: `/api/recipes/post/page/${pageNum}${filters}` })

    return {
        getRecipe,
        createRecipe,
        updateRecipe,
        deleteRecipe,
        getStep,
        getRecipes,
    }
}
export default useRecipe
