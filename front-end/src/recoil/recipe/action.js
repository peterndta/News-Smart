import { get, post } from '../../utils/ApiCaller'

const useRecipe = () => {
    const getRecipe = (id) =>
        get({
            endpoint: `api/post/${id}`,
        })

    const createRecipe = (userId, recipe) =>
        post({
            endpoint: `/api/user/${userId}/post`,
            body: recipe,
        })

    return {
        getRecipe,
        createRecipe,
    }
}
export default useRecipe
