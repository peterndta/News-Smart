import { get, post } from '../../utils/ApiCaller'

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

    const getRecipes = (filters, pageNum = 1) => console.log(`/api/post/page/${pageNum}${filters}`)

    const getRecipesFilterCategory = (filters, pageNum = 1) =>
        console.log(`/api/post/category/page/${pageNum}${filters}`)

    const getRecipesFilterMethod = (filters, pageNum = 1) =>
        console.log(`/api/post/mthod/page/${pageNum}${filters}`)

    return {
        getRecipe,
        createRecipe,
        getStep,
        getRecipes,
        getRecipesFilterCategory,
        getRecipesFilterMethod,
    }
}
export default useRecipe
