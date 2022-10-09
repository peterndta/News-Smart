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

    return {
        getRecipe,
        createRecipe,
        getStep,
    }
}
export default useRecipe
